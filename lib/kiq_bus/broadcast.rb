module KiqBus
  class Broadcast

    def self.run subscribers, *args
      return unless subscribers.present?
      subscribers.each { |sbscbr| sbscbr.call(*args) }
      true
    end
  end
end
