require "spec_helper"
require "yaml"

describe Campbot do

  before do
    @params = { :token => "9999999999999999999999999999999", :subdomain => "testing" }
    @user
    @room
  end

  describe "#initiliaze" do
    it "should initiaze a new object" do
      @campbot = Campbot.new(@params)
      @campbot.should be_an_instance_of(Campbot)
    end

    it "should raise an error without token params" do
      @params.delete(:token)
      expect { Campbot.new(@params) }.to raise_error("You must pass an API key")
    end

    it "should raise an error without subdomain params" do
      @params.delete(:subdomain)
      expect { Campbot.new(@params) }.to raise_error("You must pass a subdomain")
    end

    it "should load the configuration from the yml file" do
      config = YAML::load(File.open('config.yml'))
      config.should have_key("site")
      config.should have_key("rooms")
    end

  end

end
