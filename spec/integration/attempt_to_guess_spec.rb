require 'spec_helper'

Capybara.app = Rack::Builder.new do 
  eval(File.read(File.expand_path('config.ru')))
end

describe 'form in games#started' do
  before { visit '/games/started' }

  it 'anyway saves @answer as content visiting games#attempt_to_guess on click' do
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    page.has_content?('4444')
  end

  it 'form in games#started has input' do
    page.has_css?('.submit_btn')
  end

  it 'form in games#started has input' do
    page.has_css?('.submit_btn')
  end

  it 'renders page with error when GAME IS ENDED' do
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    fill_in 'answer', :with => '4444'
    find(:css, '.submit_btn').click
    page.has_content?('YOU lose THE GAME, THE GAME IS ENDED')
  end
end