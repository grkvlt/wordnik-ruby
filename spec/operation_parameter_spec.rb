require 'spec_helper'

describe Wordnik::OperationParameter do

  before(:each) do
    VCR.use_cassette('words', :record => :new_episodes) do
      @response = Typhoeus::Request.get("http://api.wordnik.com/v4/word.json")
    end

    @operation_parameter = Wordnik::OperationParameter.new(JSON.parse(@response.body)['endPoints'].first['operations'].first['parameters'].first)
  end

  describe "initialization" do

    it "successfully initializes" do
      @operation_parameter.should respond_to(:name)
      @operation_parameter.should respond_to(:description)
      @operation_parameter.should respond_to(:required)
      @operation_parameter.should respond_to(:param_type)
      @operation_parameter.should respond_to(:default_value)
      @operation_parameter.should respond_to(:allowable_values)
      @operation_parameter.should respond_to(:param_access)
    end

  end

end