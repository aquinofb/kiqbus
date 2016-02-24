module KiqBus
  autoload :Client, 'kiq_bus/client'
  autoload :Subscriber, 'kiq_bus/subscriber'

  def self.subscribe channel, class_name, action=:call, &block
    Client.subscribe(channel, class_name, action, &block)
  end

  # def self.unsubscribe channel, class_name
  #   Client.unsubscribe(channel, class_name)
  # end
end
