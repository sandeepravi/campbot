class Campbot

  # Public: various methods related to actions performed by the bot
  #
  # Examples
  #
  #   Campbot.say
  #   # => Campbot
  module Action

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
