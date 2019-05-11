require "puma"
require "cosimo/support/argument_parser"

module Cosimo
  class Application
    def self.initialize_application(*args)
      set_cosimo_application_info(Cosimo::Support::ArgumentParser.process(args))
    end

    def self.start
      puts "Running Cosimo #{Cosimo::VERSION}"

      begin
        system('puma config/config.ru')
      rescue Interrupt
        puts "\nShutting Down..."
      rescue => error
        puts error
      end
    end

    def self.info
      $cosimo_application_info ||= {}
    end

    def self.set_cosimo_application_info(options = {})
      $cosimo_application_info = {
        env: options[:env] || 'development',
        port: options[:port] || '3000'
      }
    end
  end
end
