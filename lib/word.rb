module Dictionary
  class Word
    attr_reader :word
    @@dictionary = []
    def initialize(attributes)
      @word = attributes.fetch(:word)
      @@dictionary.push(self)
    end
    def self.all()
      return @@dictionary
    end
    def self.clear()
      @@dictionary = []
    end
  end
end
