class Campbot

  # Public: various methods related to parsing a message 
  #
  # Examples
  #
  #   Campbot.parse
  #   # => Campbot
  module Message

    # Public: Parse the message that you get from campfire API
    #
    # params - message - A String containing the message that needs to be parsed
    #
    # Returns nothing and calls the code that needs to be executed
    def parse(message)
      return unless message["body"].is_a?(String)
      # Condition to check that bot does not get confused and starts 'listening to itself'
      #return if @users && message[:user_id] == @user['id']
      @behave.each do |matches, action|
        if mdata = message["body"].strip.match(matches)
          action.each { |d| d.call(message, mdata) }
        end
      end
    end

  end

end
