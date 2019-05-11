module Cosimo
  module Support
    class Command
      def self.run(*args)
        command = self.new(args)
        command.execute
      end
    end
  end
end
