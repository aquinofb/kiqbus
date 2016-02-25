module KiqBus
  class BackgroundJob

    cattr_accessor :adapter
    @@adapter = KiqBus::Adapters::Sidekiq # default adapter

    class << self
      delegate :perform, to: @@adapter
    end

    def self.adapter= adapter_name
      raise "Invalid adapter name. Adapter name must be a Symbol." unless adapter_name.class.eql?(Symbol)
      @@adapter = "KiqBus::Adapters::#{adapter_name.to_s.classify}".constantize
    end
  end
end
