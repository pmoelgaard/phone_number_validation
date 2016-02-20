require "httparty"
require "hashable"
require "phone_number_validation/version"
require "phone_number_validation/validate/validate_options"
require "phone_number_validation/validate/validate_request"
require "phone_number_validation/validate/validate_response"
require "phone_number_validation/validate/validate_exception"


module NumverifyLayer

  class Client

    include HTTParty

    base_uri 'apilayer.net/api'

    def initialize(access_key)

      if access_key.nil?
        raise NumverifyLayer::MissingArgumentException.new 'access_key'
      end

      @access_key = access_key

    end


    def validate(number, options = {})

      if number.nil?
        raise NumverifyLayer::MissingArgumentException.new 'number'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.number = number

      # We then create the Request
      req = NumverifyLayer::ValidateRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/validate', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (!res[NumverifyLayer::ValidateResponse::SUCCESS_EXPR])
          raise NumverifyLayer::ValidateException.new res[NumverifyLayer::ValidateResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return

      end
    end

  end

end
