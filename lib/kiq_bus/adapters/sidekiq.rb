module KiqBus
  module Adapters
    class Sidekiq

      def self.perform model_class, action, *args
        klass = model_class.constantize
        klass.respond_to?(action) && klass.delay.send(action, *args)
      end
    end
  end
end
