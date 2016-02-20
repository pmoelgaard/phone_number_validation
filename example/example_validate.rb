require 'dotenv'
require 'phone_number_validation'
require 'phone_number_validation/validate_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = NumverifyLayer::Client.new(ENV['ACCESS_KEY'])

  # Set the number to check
  number = '+14158586273'

  # We declare the options
  options = NumverifyLayer::ValidateOptions.new()

  # We make the call to validate
  response = @client.validate(number, options)

  # If its a success, we print a message to the user
  if !response.nil?
    puts 'SUCCESS : Number validated...' << response.to_s
  end

rescue => e
  puts e.inspect

end
