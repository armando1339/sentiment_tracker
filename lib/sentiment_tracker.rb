require "sentiment_tracker/railtie"
require "light-service"
require "sentiment_al"

require_relative 'sentiment_tracker/models/text'
require_relative 'sentiment_tracker/models/sentence'
require_relative 'sentiment_tracker/models/sentiment'

require 'sentiment_tracker/strategies/prepare_params'
require 'sentiment_tracker/strategies/process_sentiment'
require 'sentiment_tracker/service'
