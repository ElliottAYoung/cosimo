require "cosimo/support/command"

module Cosimo
  module Support
    module Commands
      class Start < Cosimo::Support::Command
        def initialize(*args)
          Cosimo.application.initialize_application(args)
        end

        def execute
          Cosimo.application.start
        end
      end
    end
  end
end
