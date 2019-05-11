require "cosimo/errors/no_command_error"

require "cosimo/support/commands/console"
require "cosimo/support/commands/generate"
require "cosimo/support/commands/new"
require "cosimo/support/commands/start"

module Cosimo
  module Support
    module CommandParser
      def self.find_command(command_name)
        begin
          reference_command_name = ActiveSupport::Inflector.camelize(command_name)
          Cosimo::Support::Commands.const_get(reference_command_name)
        rescue NameError
          raise Cosimo::NoCommandError.new(command_name)
        end
      end
    end
  end
end
