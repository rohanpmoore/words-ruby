require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')

get('/') do
  @words = Dictionary::Word.all
  erb(:main)
end

post('/submit') do
  word = params['word-field']
  new_word = Dictionary::Word.new({:word=> word})
  @words = Dictionary::Word.all
  erb(:main)
end

get('/word/:id') do
  @word = Dictionary::Word.fetch(params[:id])
  erb(:word)
end

post('/word/:id') do
  @word = Dictionary::Word.fetch(params[:id])
  definition = params['definition']
  @word.add_definition(definition)
  erb(:word)
end
