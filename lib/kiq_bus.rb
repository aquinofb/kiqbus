module KiqBus
  autoload :Client, 'kiq_bus/client'
  autoload :Subscriber, 'kiq_bus/subscriber'
  autoload :Broadcast, 'kiq_bus/broadcast'
  autoload :BackgroundJob, 'kiq_bus/background_job'

  module Adapters
    autoload :Sidekiq, 'kiq_bus/adapters/sidekiq'
  end

  mattr_accessor :background_job
  @@background_job = KiqBus::BackgroundJob

  class << self
    delegate :subscribe, :broadcast, :unsubscribe, to: :'KiqBus::Client'
  end
end
