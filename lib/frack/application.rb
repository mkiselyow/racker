module Frack
  class Application
    class << self
      attr_accessor :env

      def call(env)
        self.env = env
        request = Rack::Request.new(env)
        p request.params['answer']
        response = Rack::Response.new(*dispatch)
        response.set_cookie('answer', request.params['answer'])
        p response['answer']
        p response.headers
        response
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