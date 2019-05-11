require "active_support"

require "cosimo/version" unless (Cosimo::VERSION rescue false)
require "cosimo/model"
require "cosimo/triggers"
require "cosimo/application"

require "cosimo/support/command_parser"

module Cosimo
  def self.application
    Cosimo::Application
  end
end
