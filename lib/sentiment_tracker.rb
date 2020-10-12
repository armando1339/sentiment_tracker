require "sentiment_tracker/railtie"
require "jbuilder"
require "light-service"
require "sentiment_al"

require_relative 'sentiment_tracker/models/text'
require_relative 'sentiment_tracker/models/sentence'
require_relative 'sentiment_tracker/models/sentiment'
require_relative 'sentiment_tracker/controllers/sentiment_base_controller'
require_relative 'sentiment_tracker/controllers/texts_controller'

require 'sentiment_tracker/strategies/prepare_params'
require 'sentiment_tracker/strategies/process_sentiment'
require 'sentiment_tracker/service'
require 'sentiment_tracker/routing'
