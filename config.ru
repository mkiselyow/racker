# require './lib/custom_header'
# require './lib/welcome'
require './lib/racker'

# app = Rack::Builder.new do
#   use Rack::Welcome
#   use Rack::CustomHeader
#   run proc { |env| [200, { 'Content-Type' => 'text/plain' }, ['Hello!']] }
# end

# run app

# class Racker
#   def call(env)
#     Rack::Response.new('We use Rack::Response! Yay!')
#   end
# end

run Racker