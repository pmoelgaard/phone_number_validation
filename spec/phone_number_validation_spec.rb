require 'dotenv'
require 'spec_helper'
require 'phone_number_validation'


# Load Environment Variables
Dotenv.load


describe NumverifyLayer do


  it 'has a version number' do
    expect(NumverifyLayer::VERSION).not_to be nil
  end


  it 'validate' do

    begin

      # Declare the Client instance passing in the authentication parameters
      @client = NumverifyLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the query to detect
      number = '+14158586273'

      # We declare the options
      options = NumverifyLayer::ValidateOptions.new()

      # We make the call to validate
      response = @client.validate(number, options)

      # First we check the response
      expect(response).not_to be nil

    rescue => e
      puts e.inspect

    end

  end

end




