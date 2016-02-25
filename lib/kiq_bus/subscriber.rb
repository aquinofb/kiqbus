module KiqBus
  class Subscriber

    def initialize model_class, action
      @model_class, @action = model_class, action
    end

    def call *args
      KiqBus.background_job.perform(@model_class, @action, *args)
    end

    def equal? model_class, action=:call
      @model_class.eql?(model_class) && @action.eql?(action)
    end
  end
end
