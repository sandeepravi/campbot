class Campbot

  # Public: various methods related to the User
  #
  # Examples
  #
  #   Campbot.get_user
  #   # => Campbot
  module User

    # Public: Gets user details from campfire API
    #
    # Returns the Campbot Object with @user set
    def get_user
      puts "Getting user details....\n"
      call = Net::HTTP::Get.new('/users/me.json')
      call.basic_auth @token, 'x'
      connection = Net::HTTP.new("#{@subdomain}.campfirenow.com", 443)
      connection.use_ssl = true
      if user = connection.request(call).body
        @user = Yajl::Parser::parse(user)['user'] 
      end
      self
    end

  end

end
