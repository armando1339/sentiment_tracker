module SentimentTracker
  class Service
    extend LightService::Organizer

    def self.call(args = {})
      with(args).reduce(
        [
          SentimentTracker::PrepareParams,
          SentimentTracker::ProcessSentiment
        ]
      )
    end
  end
end