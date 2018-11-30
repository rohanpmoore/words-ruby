require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('website', {:type => :feature}) do
  it('adds words as instructed by the user') do
    visit('/')
    fill_in('word-field', :with => "telephone")
    click_button('Submit!')
    expect(page).to have_content("telephone")
  end
end
