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
    end
    describe('.clear') do
      it('clears the database of words') do
        Dictionary::Word.clear
        expect(Dictionary::Word.all).to(eq([]))
      end
    end
  end
end
