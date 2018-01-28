require 'spec_helper'

Capybara.app = Rack::Builder.new do 
  eval(File.read(File.expand_path('config.ru')))
end

describe 'form in games#started' do
  before { visit '/games/started' }

  it 'renders games#attempt_to_guess on click' do
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    expect(page).to have_content('games#attempt_to_guess')
    expect(page).to have_content('games#attempt_to_guess')
    page.has_content?('4444')
  end

  it 'form in games#started has input' do
    page.has_css?('.submit_btn')
  end

  it 'form in games#started has input' do
    page.has_css?('.submit_btn')
  end
end