# frozen_string_literal: true

require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Error < StandardError; end

  class Application
    # def call(env)
    #   if env["PATH_INFO"] == "/favicon.ico"
    #     [404, { "Content-Type" => "text/html" }, []]
    #   elsif env["PATH_INFO"] == "/"
    #     [302, { 'Location' => "/quotes/a_quote" }, []]
    #   else
    #     klass, act = get_controller_and_action(env)
    #     controller = klass.new(env)
    #     text = controller.send(act)
    #     r = controller.get_response
    #     if r
    #       [r.status, r.headers, [r.body].flatten]
    #     else
    #       [200, { 'Content-Type' => 'text/html' }, [text]]
    #     end
    #   end
    # end
    #
    def call(env)
      if env['PATH_INFO'] == "/favicon.ico"
        [404, { "Content-Type" => "text/html" }, []]
      end

      rack_app = get_rack_app(env)
      rack_app.call(env)
    end
  end
end
