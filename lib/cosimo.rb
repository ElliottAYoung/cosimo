require "active_support"

require "cosimo/version" unless (Cosimo::VERSION rescue false)
require "cosimo/model"
require "cosimo/triggers"
require "cosimo/application"
require "cosimo/connection"

require "cosimo/support/command_parser"

module Cosimo
  def self.application
    Cosimo::Application
  end

  def self.connection
    $cosimo_messaging_connection || Cosimo::Connection
  end
end
