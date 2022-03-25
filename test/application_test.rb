# frozen_string_literal: true

require_relative "test_helper"

class TestController < Rulers::Controller
  def index
    "Hello"
  end
end

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/route"

    assert last_response.ok?
    body = last_response.body
    assert_equal(body, 'Hello')
  end

  def test_content_length
    get "/"

    last_response.status
    assert_equal(302, last_response.status)
  end
end
