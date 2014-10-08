require 'spec_helper'

describe Infusionsoft::Client do

  subject { Infusionsoft::Client.new(options) }

  let!(:options) do
    {
      expires_at: 1577836800, # Replace expires_at after 2020-01-01 :)
      token: 'c249023',
      refresh_token: 'r32454v4',
      client_secret: 'pl3ioc90cq',
      client_id: 'c3n894c-xc3m1-903cn024'
    }
  end

  let!(:token2) do
    Infusionsoft::Client.new(options.merge(expires_at: Time.now - 30))
  end

  describe '#oauth_client' do
    it 'returns an OAuth2::Client' do
      expect(subject.oauth_client).to be_a(OAuth2::Client)
    end

    context 'OAuth2::Client' do
      it 'assigns OAuth2::Client#id' do
        expect(subject.oauth_client.id).to eq('c3n894c-xc3m1-903cn024')
      end

      it 'assigns OAuth2::Client#secret' do
        expect(subject.oauth_client.secret).to eq('pl3ioc90cq')
      end
    end
  end

  describe '#credentials' do
    it 'returns a hash with the OAuth2::AccessToken credentials' do
      expect(subject.credentials[:token]).to eq('c249023')
      expect(subject.credentials[:expires_at]).to eq(1577836800)
      expect(subject.credentials[:refresh_token]).to eq('r32454v4')
    end
  end

  describe '#expired?' do
    it 'returns true if the current access token has expired' do
      expect(token2.expired?).to eq(true)
    end

    it 'returns false if the current access token has not expired' do
      expect(subject.expired?).to eq(false)
    end
  end

  describe '#refresh_access_token' do
    it 'returns a hash of credentials if the access_token has not expired' do
      expect(subject.refresh_access_token[:token]).to eq('c249023')
      expect(subject.refresh_access_token[:expires_at]).to eq(1577836800)
      expect(subject.refresh_access_token[:refresh_token]).to eq('r32454v4')
    end
  end

end
