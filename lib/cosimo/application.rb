require "puma"

require "cosimo/support/argument_parser"
require "cosimo/support/server"
require "cosimo/support/trigger_subscriptions"

require "cosimo/application/configuration"

module Cosimo
  class Application
    def self.config
      $cosimo_application_configuration ||= Cosimo::Application::Configuration.new
    end

    def self.initialize_application(args = [])
      set_cosimo_application_info(Cosimo::Support::ArgumentParser.process(args.flatten))
      load_configuration
      set_trigger_subscriptions
    end

    def self.start
      puts "Running Cosimo #{Cosimo::VERSION} in #{info[:env]}"

      begin
        Cosimo::Support::Server.start
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

    def self.load_configuration
      require "#{Dir.pwd}/config/environments/#{info[:env]}" rescue nil
      config.load(info[:env])
    end

    def self.set_trigger_subscriptions
      Cosimo.connection.open

      Cosimo::Support::TriggerSubscriptions.build
    end
  end
end
