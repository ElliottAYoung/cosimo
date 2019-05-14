module Cosimo
  module Support
    module Server
      def self.start
        system(command)
      end

      def self.command
        "puma config/config.ru -p #{Cosimo.application.info[:port]}"
      end
    end
  end
end
