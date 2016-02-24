module KiqBus
  autoload :Client, 'kiq_bus/client'
  autoload :Subscriber, 'kiq_bus/subscriber'
  autoload :Broadcast, 'kiq_bus/broadcast'

  def self.subscribe channel, class_name, action=:call, &block
    Client.subscribe(channel, class_name, action, &block)
  end

  def self.broadcast channel, *args
    Client.broadcast(channel, *args)
  end

  # def self.unsubscribe channel, class_name
  #   Client.unsubscribe(channel, class_name)
  # end
end
