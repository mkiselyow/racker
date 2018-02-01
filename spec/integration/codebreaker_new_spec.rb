require 'spec_helper'

Capybara.app = Rack::Builder.new do 
  eval(File.read(File.expand_path('config.ru')))
end

describe 'cookies form in games#started' do
  before { visit '/games/started' }

  it 'saves entities between pages' do
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    page.visit('/games')
    page.has_content?('4444')
  end

  # it 'saves entities between pages' do
  #   fill_in 'answer', :with => '4444'
  #   find(:css, '.submit_btn').click
    
  # end
end