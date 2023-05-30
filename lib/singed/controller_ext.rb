module Singed
  module ControllerExt
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      # Define an around_action to generate flamegraph for a controller action.
      def flamegraph(target_action, ignore_gc: false, interval: 1000, open: true)
        around_action(only: target_action) do |controller, action|
          controller.flamegraph(ignore_gc: ignore_gc, interval: interval, open: open, &action)
        end
      end
    end
  end
end
