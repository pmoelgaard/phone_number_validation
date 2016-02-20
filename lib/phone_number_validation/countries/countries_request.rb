require "hashable"

module NumverifyLayer

  class CountriesRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})
      self.query = query;
    end

  end
end