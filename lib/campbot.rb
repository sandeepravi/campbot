require "campbot/version"
require "yaml"

# Public: Contains all the methods are directly needed for Bot
# 
# Examples
#
#   Campbot.new(:token => "857987f9s879f8sd7f9s7f9sdf78", :subdomain => "xxxx")
#   # => Campbot
class Campbot

  # Public: Initialize a Campbot
  #
  # params - A Hash containing:
  #          :token - The API token of the Campbot
  #          :subdomain - The subdomain of the campfire site
  def initialize(params)

    raise ArgumentError, "You must pass an API key" unless params[:token]
    raise ArgumentError, "You must pass a subdomain" unless params[:subdomain]

    config = YAML::load( File.open("config.yml"))
  end
end
