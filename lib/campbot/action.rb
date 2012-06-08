class Campbot

  # Public: various methods related to actions performed by the bot
  #
  # Examples
  #
  #   Campbot.say
  #   # => Campbot
  module Action

    # Public: Method used to post a message to campfire using the API
    #
    # params - message - The message that needs to be posted
    #          type - The type of message, default to 'TextMessage'
    #
    # Returns the Object after posting the messing to campfire
    def say(message, type = 'TextMessage')
      request = Net::HTTP::Post.new("/room/#{@room}/speak.json", 'Content-Type' => 'application/json')
      request.body = "{\"message\":{\"type\":\"#{type}\",\"body\":\"#{message}\"}}"
      request.basic_auth @token, 'x'
      http = Net::HTTP.new("#{@subdomain}.campfirenow.com", 443)
      http.use_ssl = true
      http.request(request)
    end

  end

end
