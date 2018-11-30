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
  
  it('can add definitions to words') do
    visit('word/0')
    fill_in('definition', :with => "an apparatus, system, or process for transmission of sound or speech to a distant point, especially by an electric device.")
    click_button('Submit!')
    expect(page).to have_content("an apparatus, system, or process for transmission of sound or speech to a distant point, especially by an electric device.")
  end
end
