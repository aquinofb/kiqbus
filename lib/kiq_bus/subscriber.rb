module KiqBus
  class Subscriber

    def initialize class_name, action, &block
      @subscribed_class, @action, @block = class_name, action, block
    end

    def call *args
      # Run on background job or Thread(Beware of db connections)
      klass = @subscribed_class.constantize
      klass.send(@action, *args) if klass.respond_to?(@action)
      @block.call(*args) if @block.present?
    end
  end
end
