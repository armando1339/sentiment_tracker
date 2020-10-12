module SentimentTracker
  class PrepareParams
    extend LightService::Action
    expects :params

    executed do |context|
      unless context.params.kind_of? ActionController::Parameters
        context.params = ActionController::Parameters.new context.params
      end

      context.params = context.params.permit(data_processable: [:description])
    end
  end
end