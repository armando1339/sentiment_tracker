module SentimentTracker
  class ProcessSentiment
    extend LightService::Action
    expects :params
    promises :processed_texts

    executed do |context|
      context.processed_texts = Text.create context.params.fetch('data_processable')
    end
  end
end