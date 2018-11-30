require('rspec')
require('word')

describe('Dictionary') do
  describe('Word') do
    describe('#initialize') do
      it('creates a new word based on user input') do
        word = Dictionary::Word.new({:word=> "airplane"})
        expect(word.word).to(eq('airplane'))
      end
    end
  end
end
