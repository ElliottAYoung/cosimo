module Cosimo
  class NoCommandError < NameError
    def initialize(command_name)
      msg = "Cosimo Command #{command_name} not found."
      super msg
    end
  end
end
