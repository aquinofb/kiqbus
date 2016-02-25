module KiqBus
  class Subscriber

    def initialize model_class, action
      @model_class, @action = model_class, action
    end

    def equal? model_class, action=:call
      @model_class.eql?(model_class) && @action.eql?(action)
    end

    def call *args
      klass = @model_class.constantize
      klass.delay.send(@action, *args) if klass.respond_to?(@action)
    end
  end
end
