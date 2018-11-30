require('rspec')
require('word')

describe('Dictionary') do
  describe('Word') do
    before() do
      Dictionary::Word.clear
    end
    describe('#initialize') do
      it('creates a new word based on user input') do
        word = Dictionary::Word.new({:word=> "airplane"})
        expect(word.word).to(eq('airplane'))
        expect(word.definitions).to(eq([]))
      end
      it('adds the new word to the database immediately') do
        word = Dictionary::Word.new({:word=> "telephone"})
        expect(Dictionary::Word.all).to(eq([word]))
      end
    end
    describe('.all') do
      it('gets an empty array if no words exist') do
        expect(Dictionary::Word.all).to(eq([]))
      end
      it('receives an array of all existing words') do
        word1 = Dictionary::Word.new({:word=> "airplane"})
        expect(Dictionary::Word.all).to(eq([word1]))
        word2 = Dictionary::Word.new({:word=> "telephone"})
        expect(Dictionary::Word.all).to(eq([word1, word2]))
      end
    end
    describe('.clear') do
      it('clears the database of words') do
        Dictionary::Word.clear
        expect(Dictionary::Word.all).to(eq([]))
      end
    end
    describe('#add_definition') do
      it('adds a new definition to a word') do
        word = Dictionary::Word.new({:word=> "telephone"})
        word.add_definition("an apparatus, system, or process for transmission of sound or speech to a distant point, especially by an electric device.")
        expect(word.definitions).to(eq(["an apparatus, system, or process for transmission of sound or speech to a distant point, especially by an electric device."]))
      end
    end
    describe('.fetch') do
      it('fetches a specific word based on its id') do
        word1 = Dictionary::Word.new({:word=> "airplane"})
        word2 = Dictionary::Word.new({:word=> "telephone"})
        word3 = Dictionary::Word.new({:word=> "dog"})
        expect(Dictionary::Word.fetch(1)).to(eq(word2))
      end
    end
  end
end
