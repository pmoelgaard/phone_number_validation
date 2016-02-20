require "hashable"

module LanguageLayer

  class LanguagesRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})
      self.query = query;
    end

  end
end