require "campbot/version"
require "yaml"
require 'yajl'
require "campbot/user"

# Public: Contains all the methods are directly needed for Bot
# 
# Examples
#
#   Campbot.new(:token => "857987f9s879f8sd7f9s7f9sdf78", :subdomain => "xxxx")
#   # => Campbot
class Campbot

  include User

  attr_accessor :token, :subdomain, :rooms, :user

  # Public: Initialize a Campbot
  #
  # params - A Hash containing:
  #          :token - The API token of the Campbot
  #          :subdomain - The subdomain of the campfire site
  def initialize(params)

    params ||= {}

    raise ArgumentError, "You must pass an API key" unless params[:token]
    raise ArgumentError, "You must pass a subdomain" unless params[:subdomain]
    raise ArgumentError, "You need to pass the rooms I need to join" unless params[:rooms]

    params.each do |key, value|
      send("#{key}=", value)
    end
  end

  def listen!
    get_user
  end

end
