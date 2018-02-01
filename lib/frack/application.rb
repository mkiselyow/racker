module Frack
  class Application
    class << self
      attr_accessor :env

      def call(env)
        self.env = env
        @request = Rack::Request.new(env)
        @response = Rack::Response.new(*dispatch(env))
        # p "env ======= #{env}" if @request.params['answer']
        # @response.set_cookie('answer', 'some text')
        # p "@request.params['answer'] ======= #{@request.params['answer']}" if @request.params['answer']
        # @response.redirect('/games/started') if @request.params['answer']
        # p "env ======= #{env}" if @request.params['answer']
        # p "env[\"rack.request.form_hash\] ======= #{env["rack.request.form_hash['answer']"]}" if @request.params['answer']
        # p "env[\"rack.request.rack.request.form_input\] ======= #{env["rack.request.rack.request.form_input"]}" if @request.params['answer']
        # p "@request.params ======= #{@request.params}" if @request.params['answer']
        @response#.finish
      end

      def dispatch(env)
        controller.new.public_send(env['action'], env)
      end

      def controller
        Object.const_get(env['controller'].capitalize + 'Controller')
      end
    end
  end
end