class Campbot

  # Public: various methods related to parsing a message 
  #
  # Examples
  #
  #   Campbot.parse
  #   # => Campbot
  module Message

    def parse(message)
      return unless message[:body].is_a?(String)
      # Condition to check that bot does not get confused and starts 'listening to itself'
      #return if @users && message[:user_id] == @user['id']
      @behave.each do |matches, action|
        puts matches
        puts action
        if mdata = message[:body].strip.match(matches)
          action.each { |d| d.call(item, mdata) }
        end
      end
    end

  end

end
