require 'oauth2'
require 'xmlrpc/client'

require 'infusionsoft/version'
require 'infusionsoft/api'
require 'infusionsoft/client'
require 'infusionsoft/exceptions'
require 'infusionsoft/exception_handler'

module Infusionsoft

  def self.new(hash)
    Infusionsoft::Client.new(hash)
  end

end
