require "phone_number_validation/version"

module NumverifyLayer

  class CountriesException < Exception

    attr_accessor :error

    def initialize(error)
      self.error = error
    end

  end

end
