module KiqBus
  class Client
    cattr_reader :subscribers
    @@subscribers = {}

    def self.subscribe channel, class_name, action=:call
      @@subscribers[channel] ||= []
      @@subscribers[channel] << Subscriber.new(class_name, action.to_sym)
    end

    def self.broadcast channel, *args
      Broadcast.run(@@subscribers[channel], *args)
    end

    def self.unsubscribe channel, model_class, action=:call
      index = @@subscribers[channel].index { |subscriber| subscriber.equal?(model_class, action) }
      index >= 0 && @@subscribers[channel].delete_at(index)
    end
  end
end
