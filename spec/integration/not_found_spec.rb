require 'spec_helper'

Capybara.app = Rack::Builder.new do 
  eval(File.read(File.expand_path('config.ru')))
end

describe 'users#index' do
  before { visit '/ssss' }

  it 'renders not_found view' do
    expect(page).to have_content('Oops, This Page Not Found!')
  end
end