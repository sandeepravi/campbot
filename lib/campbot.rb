require "campbot/version"

class Campbot

  def initialize(config)

    raise ArgumentError, "You must pass an API key" unless options[:api_key]
    raise ArgumentError, "You must pass a subdomain" unless options[:subdomain]

  end
end
