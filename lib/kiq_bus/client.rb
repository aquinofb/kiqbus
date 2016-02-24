module KiqBus
  class Client

    cattr_reader :subscribers
    @@subscribers = {}

    class << self
      def subscribe channel, class_name, action=:call, &block
        @@subscribers[channel] ||= []
        @@subscribers[channel] << Subscriber.new(class_name, action.to_sym, &block)
      end

      def broadcast channel, *args
        Broadcast.run(@@subscribers[channel], *args)
      end

      # def unsubscribe channel, class_name
        # @@subscribers[channel].delete(class_name)
      # end
    end

  end
end
