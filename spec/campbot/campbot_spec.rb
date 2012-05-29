require "spec_helper"
require "yaml"

describe Campbot do

  before do
    @params = { :token => "9999999999999999999999999999999", :subdomain => "testing", :rooms => ["22222"] }
    @user = "{\"user\":{\"type\":\"Member\",\"created_at\":\"2010/11/11 15:22:59 +0000\",\"admin\":false,\"id\":55555,\"avatar_url\":\"http://asset0.37img.com/global/72342423424153563/avatar.gif?r=3\",\"email_address\":\"testing@testing.com\",\"name\":\"First Last\",\"api_auth_token\":\"894364683276458276482758\"}}"
    @room
  end

  describe "#initialize" do
    it "should initialize a new object" do
      campbot = Campbot.new(@params)
      campbot.should be_an_instance_of(Campbot)
    end

    it "should raise an error without token params" do
      @params.delete(:token)
      expect { Campbot.new(@params) }.to raise_error("You must pass an API key")
    end

    it "should raise an error without subdomain params" do
      @params.delete(:subdomain)
      expect { Campbot.new(@params) }.to raise_error("You must pass a subdomain")
    end

    it "should set the accessor values based on params" do
      campbot = Campbot.new(@params)
      campbot.subdomain.should eq(@params[:subdomain])
      campbot.token.should eq(@params[:token])
      campbot.rooms.should eq(@params[:rooms])
    end
  end

  describe "listen!" do
    it "should load the user details" do
      campbot = Campbot.new(@params)
      stub_request(:get, "https://#{@params[:token]}:x@#{@params[:subdomain]}.campfirenow.com/users/me.json").
         with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => @user, :headers => {})
      campbot.listen!.user.should_not be_nil
    end

    it "should join the room specified" do
      campbot = Campbot.new(@params)
      campbot.listen!.should_not be_nil
    end

    it "should return an error for incorrect room" do
      @params[:room] = 1
      expect { Campbot.new(@params).listen! }.to raise_error("There was an error joining the room")
    end
  end

end
