require 'cosimo/application/autoloader'

module Cosimo
  class Application
    class Configuration
      attr_accessor :autoload_paths, :queue_prefix, :messaging_host, :messaging_port, :messaging_username, :messaging_password

      def initialize
        @autoload_paths = set_autoload_paths
        @queue_prefix = "model.crud."
        @messaging_host = "localhost"
        @messaging_port = "5672"
        @messaging_username = ''
        @messaging_password = ''
      end

      def load(env)
        Cosimo::Application::Autoloader.run(self)
      end

      private

      def set_autoload_paths
        ["#{Dir.pwd}/app/models", "#{Dir.pwd}/app/triggers", "#{Dir.pwd}/app/services"]
      end
    end
  end
end
