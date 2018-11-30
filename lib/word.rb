module Dictionary
  class Word
    attr_reader :word, :definitions
    @@dictionary = []
    def initialize(attributes)
      @word = attributes.fetch(:word)
      @definitions = []
      @@dictionary.push(self)
    end
    def self.all()
      return @@dictionary
    end
    def self.clear()
      @@dictionary = []
    end
    def add_definition(definition)
      @definitions.push(definition)
    end
  end
end
