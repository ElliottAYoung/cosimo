module Cosimo
  module Support
    module ArgumentParser
      def self.process(args = [])
        return {} if args.empty?

        flag_pairs = find_flag_pairs(args)
        map_arguments(flag_pairs)
      end

      def self.find_flag_pairs(args)
        flags = args.select { |arg| arg[0] == '-' }

        flags.map do |flag|
          index = args.index(flag)
          [flag, args[index + 1]]
        end
      end

      def self.map_arguments(argument_pairs)
        arg_output = {}

        argument_pairs.each do |flag, value|
          arg_output[argument_reference[flag]] = value
        end

        arg_output
      end

      def self.argument_reference
        @argument_reference ||= {
          '-p' => :port,
          '-e' => :env
        }
      end
    end
  end
end
