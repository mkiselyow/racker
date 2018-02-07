$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'rack'
require 'tilt'

module Frack
  autoload :Router, 'lib/frack/router'
  autoload :Application, 'lib/frack/application'
  autoload :BaseController, 'lib/frack/base_controller'
end