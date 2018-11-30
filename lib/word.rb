module Dictionary
  class Word
    attr_reader :word
    @@dictionary = []
    def initialize(attributes)
      @word = attributes.fetch(:word)
    end
    def self.all()
      return @@dictionary
    end
  end
end
