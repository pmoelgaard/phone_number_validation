require "phone_number_validation/version"

module NumverifyLayer

  class ValidateOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :number
    attr_accessor :country_code

    def initialize()
      @query = nil
    end

  end

end
