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
      puts "Joining room...\n"
      call = Net::HTTP::Get.new("/room/#{@room}/join.json")
      call.basic_auth @token, 'x'
      connection = Net::HTTP.new("#{@subdomain}.campfirenow.com", 443)
      connection.use_ssl = true
      connection.request(call)
      self
    end

    # Public: Start listening on a room using campfire API
    #
    # Returns the self (Campbot) Object
    def listen
      while true
        http = Net::HTTP.new('streaming.campfirenow.com', 443)
        http.use_ssl = true

        uri = URI.parse("http://#{@token}:x@streaming.campfirenow.com/room/#{@room}/live.json")
        Yajl::HttpStream.get(uri) do |item|
          puts item.inspect
          Message::parse(item)
        end
      end
    end

  end

end
