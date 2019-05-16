module Cosimo
  module Support
    module TriggerSubscriptions
      def self.build
        triggers = Dir.entries("#{Dir.pwd}/app/triggers/").select { |file| file.include?("_triggers.rb") && file != "application_triggers.rb" }

        triggers.each do |trigger_file_name|
          queue_suffix_name = trigger_file_name.split("_triggers.rb").first
          queue_name = Cosimo.application.config.queue_prefix + queue_suffix_name

          set_subscription(queue_name)
        end
      end
    end
  end
end
