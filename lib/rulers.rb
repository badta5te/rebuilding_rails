# frozen_string_literal: true

require "rulers/version"
require "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      pp "called rullers/application/call"
      [404, { "Content-Type" => "text/html" }, []] if env["PATH_INFO"] == "/favicon"

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { "Content-Type" => "text/html" },
       [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
