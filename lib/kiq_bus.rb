module KiqBus
  autoload :Client, 'kiq_bus/client'
  autoload :Subscriber, 'kiq_bus/subscriber'
  autoload :Broadcast, 'kiq_bus/broadcast'

  class << self
    delegate :subscribe, :broadcast, :unsubscribe, to: :'KiqBus::Client'
  end
end

require 'sidekiq'
