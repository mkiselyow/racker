require 'spec_helper'

Capybara.app = Rack::Builder.new do 
  eval(File.read(File.expand_path('config.ru')))
end

describe 'users#index' do
  before { visit '/games' }

  it 'renders layout' do
    expect(page).to have_content('application#layout')
  end

  it 'renders games#index view' do
    expect(page).to have_content('games#index')
  end

  it 'contains Codebreaker::Game constant' do 
    expect(page).to have_content('4')
  end
end