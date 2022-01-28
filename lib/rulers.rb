# frozen_string_literal: true

require "rulers/array"
require_relative "rulers/version"

module Rulers
  class Error < StandardError; end

  class Application
    def call(_env)
      `echo debug > debug.txt`
      [200, { "Content-Type" => "text/html" },
       ["Hello from Ruby on Rulers!"]]
    end
  end
end
