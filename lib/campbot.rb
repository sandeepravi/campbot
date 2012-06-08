require 'net/https'
require "yaml"
require 'yajl/http_stream'

require "campbot/version"
require "campbot/user"
require "campbot/room"
require "campbot/message"
require "campbot/action"

# Public: Contains all the methods are directly needed for Bot
# 
# Examples
#
#   Campbot.new(:token => "857987f9s879f8sd7f9s7f9sdf78", :subdomain => "xxxx")
#   # => Campbot
class Campbot

  include User
  include Room
  include Message
  include Action

  attr_accessor :token, :subdomain, :room, :user

  # Public: Initialize a Campbot
  #
  # params - A Hash containing:
  #          :token - The API token of the Campbot
  #          :subdomain - The subdomain of the campfire site
  def initialize(params)

    params ||= {}

    raise ArgumentError, "You must pass an API key" unless params[:token]
    raise ArgumentError, "You must pass a subdomain" unless params[:subdomain]
    raise ArgumentError, "You need to pass the rooms I need to join" unless params[:room]

    params.each do |key, value|
      send("#{key}=", value)
    end

    @user = {}
    @behave = {}
  end

  # Public: Join the room and start listening to the conversation
  #
  # Returns the self (Campbot) Object
  def start!
    get_user
    join
    puts "Started Listening...\n"
    listen
    self
  end

  # Public: Used to parse the regex matchers
  #
  # params - A Hash containing:
  #          :regex - The regex that needs to be matched with
  #          :&block - The code block that needs to be evaluated
  #
  # Returns the self object and sets the @behave object
  def check(regex, &block)
    @behave[regex] ||= []
    @behave[regex] << block
  end

end
