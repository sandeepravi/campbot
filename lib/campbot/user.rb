class Campbot

  # Public: various methods related to the User
  #
  # Examples
  #
  #   User.get_user
  #   # => Campbot
  module User

    # Public: Gets user details from campfire API
    #
    # Returns the Campbot Object with @user set
    def get_user
      request = Net::HTTP::Get.new('/users/me.json')
      request.basic_auth @token, 'x'
      http = Net::HTTP.new("#{@subdomain}.campfirenow.com", 443)
      http.use_ssl = true
      if data = http.request(request).body
        @user = Yajl::Parser::parse(data)['user']
      end
      self
    end

  end

end
