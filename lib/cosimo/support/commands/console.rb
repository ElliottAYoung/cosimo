require "pry"
require "cosimo/support/command"

module Cosimo
  module Support
    module Commands
      class Console < Cosimo::Support::Command
        def initialize(*args)
          Cosimo.application.initialize_application
        end

        def execute
          binding.pry
        end
      end
    end
  end
end
