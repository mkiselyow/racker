$LOAD_PATH << '.'
require 'rack'
require 'tilt'

require 'lib/frack'

require 'app/controllers/users_controller'

require 'app/models/user'

use Rack::Static, urls: ['/stylesheets', '/javascript', '/images'], root: 'public'
use Rack::CommonLogger
use Rack::ContentLength
use Rack::Reloader, 0
use Frack::Router do 
  match '/' => 'users#index'
end
run Frack::Application