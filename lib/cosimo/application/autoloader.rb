module Cosimo
  class Application
    module Autoloader
      def self.run(config)
        config.autoload_paths.each do |path|
          Dir["#{path}/*.rb"].each { |file| require file }
        end

        Dir["#{Dir.pwd}/config/initializers/*.rb"].each { |file| require file }
      end
    end
  end
end
