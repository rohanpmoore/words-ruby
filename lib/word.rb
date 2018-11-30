module Dictionary
  class Word
    attr_reader :word, :definitions, :id
    @@dictionary = []
    @@id_count = 0
    def initialize(attributes)
      @word = attributes.fetch(:word)
      @definitions = []
      @id = @@id_count
      @@id_count += 1
      @@dictionary.push(self)
    end
    def self.all()
      return @@dictionary
    end
    def self.clear()
      @@dictionary = []
      @@id_count = 0
    end
    def add_definition(definition)
      @definitions.push(definition)
    end
    def self.fetch(id)
      @@dictionary.each do |word|
        if(word.id == id)
          return word
        end
      end
    end
  end
end
