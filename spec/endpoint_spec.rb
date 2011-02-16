require 'spec_helper'

describe Endpoint do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://api.wordnik.com/v4/word.json")
    end
    
    @endpoint = Endpoint.new(JSON.parse(@response.body)['endPoints'].first)
  end

  describe "initialization" do

    it "successfully initializes" do
      @endpoint.path.should == "/word.{format}/{word}"
    end
    
    it "sets operations" do
      @endpoint.operations.class.should == Array
      @endpoint.operations.first.class.should == Operation
    end
        
  end
  
end