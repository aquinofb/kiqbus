module KiqBus
  class Broadcast

    def self.run subscribers, *args
      return unless subscribers.present?

      subscribers.each do |subscriber|
        subscriber.call(*args)
      end
    end
  end
end
