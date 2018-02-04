require 'spec_helper'

Capybara.app = Rack::Builder.new do 
  eval(File.read(File.expand_path('config.ru')))
end

describe 'history#index' do
  before { visit '/history' }

  it 'renders layout' do
    expect(page).to have_content('history#index')
  end

  # it 'renders index view' do
  #   expect(page).to have_content('users#index')
  # end

  # it 'shows a list of users' do 
  #   expect(page).to have_selector('li',
  #     text: /Don|Andy|Tony/, count: 3)
  # end
end