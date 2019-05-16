require 'cosimo/application/autoloader'

module Cosimo
  class Application
    class Configuration
      attr_accessor :autoload_paths

      def initialize
        @autoload_paths = set_autoload_paths
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
