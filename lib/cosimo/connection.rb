require 'bunny'

module Cosimo
  class Connection
    def self.open
      return $cosimo_messaging_connection if $cosimo_messaging_connection

      config_details = {
        host: $cosimo_application_configuration.messaging_host,
        port: $cosimo_application_configuration.messaging_port,
        username: $cosimo_application_configuration.messaging_username,
        password: $cosimo_application_configuration.messaging_password
      }

      $cosimo_messaging_connection = Cosimo::Connection.new(config_details)
    end

    attr_reader :host, :port, :username, :password, :connection

    def initialize(args = {})
      @host = args[:host] || 'localhost'
      @port = args[:port] || '5672'
      @username = args[:username] || ''
      @password = args[:password] || ''

      @connection ||= Bunny.new(host: host, port: port).start
    end

    def create_channel
      connection.create_channel
    end

    def close
      connection.close
    end
  end
end
