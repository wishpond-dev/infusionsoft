module Infusionsoft
  class Client

    include Infusionsoft::API

    def initialize(options = {})
      @oauth_client = OAuth2::Client.new(options[:client_id], options[:client_secret])

      token_options = {
        access_token:  options[:token],
        expires_at:    options[:expires_at],
        refresh_token: options[:refresh_token]
      }

      @token = OAuth2::AccessToken.from_hash(oauth_client, token_options)
    end

    def credentials
      {
        expires: true,
        token: @token.token,
        expires_at: @token.expires_at,
        refresh_token: @token.refresh_token
      }
    end

    def oauth_client
      @oauth_client
    end

    def expired?
      Time.at(credentials[:expires_at]) <= Time.now
    end

    def refresh_access_token
      return credentials unless expired?
      token_options = request_access_token

      @token = OAuth2::AccessToken.from_hash(oauth_client, token_options)
      credentials
    end

    private

    def connection(service_call, *args)

      if expired?
        raise Infusionsoft::ExpiredAccessToken.new('Access Token Expired')
      end

      client = XMLRPC::Client.new3(
        port: 443,
        use_ssl: true,
        host: 'api.infusionsoft.com',
        path: "/crm/xmlrpc/v1?access_token=#{credentials[:token]}"
      )

      args.unshift(credentials[:token])

      client.http_header_extra = {
        'User-Agent' => 'Infusionsoft (RubyGem)',
        'Accept-Encoding' => 'identity'
      }

      begin
        response = client.call(service_call, *args)
      rescue XMLRPC::FaultException => error
        # Catch all XMLRPC exceptions and rethrow specific
        # exceptions for each type of xmlrpc fault code
        #
        # This is from the original Infuionsoft API wrapper
        # https://github.com/nateleavitt/infusionsoft
        Infusionsoft::ExceptionHandler.new(error)
      end

      response
    end

    def request_access_token
      uri  = URI.parse("https://api.infusionsoft.com/token")
      http = Net::HTTP.new(uri.host, uri.port)

      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.request_uri)
      request.basic_auth(oauth_client.id, oauth_client.secret)
      request.set_form_data(
        grant_type: 'refresh_token',
        refresh_token: credentials[:refresh_token]
      )

      response = http.request(request)

      invalid  = response.code != '200'
      response = JSON.parse(response.body)

      if invalid
        raise Infusionsoft::FailedToRefreshTokenError.new(response)
      end

      response
    end

  end
end
