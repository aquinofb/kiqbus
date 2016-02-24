module KiqBus
  class Client

    cattr_reader :subscribers
    @@subscribers = {}

    def self.subscribe channel, class_name, action=:call, &block
      @@subscribers[channel.to_sym] ||= []
      @@subscribers[channel.to_sym] << KiqBus::Subscriber.new(class_name, action.to_sym, &block)
    end

    # def self.unsubscribe channel, class_name
      # @@subscribers[channel.to_sym] ||= []
      # @@subscribers[channel.to_sym].delete(class_name)
    # end
  end
end
