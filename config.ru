$LOAD_PATH << '.'
require 'rack'
require 'tilt'

require 'lib/frack'

require 'app/controllers/users_controller'
require 'app/controllers/games_controller'

require 'app/models/user'
require 'app/models/game'

use Rack::Static, urls: ['/stylesheets', '/javascript', '/images'], root: 'public'
use Rack::CommonLogger
use Rack::ContentLength
use Rack::Reloader, 0
use Frack::Router do 
  match '/' => 'users#index'
  match '/games' => 'games#index'
  match '/games/started' => 'games#start_new_game'
  match '/games/attempt_to_guess' => 'games#attempt_to_guess'
end
use Rack::Session::Pool
run Frack::Application