module Frack
  class Application
    class << self
      attr_accessor :env

      def call(env)
        self.env = env
        @request = Rack::Request.new(env)
        @response = Rack::Response.new(*dispatch)
        @response.set_cookie('answer', @request.params['answer'])
        @response.redirect('/games/started') if @request.params['answer']
        @response
      end

      def dispatch
        controller.new.public_send(env['action'])
      end

      def controller
        Object.const_get(env['controller'].capitalize + 'Controller')
      end
    end
  end
end