class Campbot

  # Public: various methods related to the Chatroom
  #
  # Examples
  #
  #   Campbot.join
  #   # => Campbot
  module Room

    # Public: Join a room using the campfire API
    #
    # Returns the self (Campbot) Object
    def join
      call = Net::HTTP::Get.new("/room/#{@room}/join.json")
      call.basic_auth @token, 'x'
      connection = Net::HTTP.new("#{@subdomain}.campfirenow.com", 443)
      connection.use_ssl = true
      connection.request(call)
      self
    end

  end

end
