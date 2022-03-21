# frozen_string_literal: true

module Rulers
  class Application
    def get_controller_and_action(env)
      [404, { "Content-Type" => "text/html" }, []] if env["PATH_INFO"] == "/favicon"

      _, cont, action, after = env["PATH_INFO"].split("/", 4)
      cont = cont.capitalize # "People"
      cont += "Controller" # "PeopleController"
      [Object.const_get(cont), action]
    end
  end
end

