module Frack
  class BaseController
    def render(view)
      render_template('layouts/application') do
        render_template(view)
      end
    end

    def render_template(path, &block)
      Tilt.new(file(path)).render(self, &block)
    end

    def file(path)
      Dir[File.join('app', 'views', "#{path}.html.*")].first
    end

    def params(env)
      Rack::Request.new(env).params
    end

    def request(env)
      Rack::Request.new(env)
    end

    def response(env)
      Rack::Response.new(env)
    end
  end
end