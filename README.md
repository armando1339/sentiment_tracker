# SentimentTracker

SentimentTracker is a plugin Rails for keep track of sentiment analysis processes.

[![Build Status](https://travis-ci.org/armando1339/sentiment_tracker.svg?branch=master)](https://travis-ci.org/armando1339/sentiment_tracker) [![Coverage Status](https://coveralls.io/repos/github/armando1339/sentiment_tracker/badge.svg?branch=master)](https://coveralls.io/github/armando1339/sentiment_tracker?branch=master)

## Usage

SentimentTracker is a plugin Rails for keep track of sentiment analysis processes. It contains a control that process the data given throught SentimentTracker::Service service. Ones the data is processed the service will create tracks about all processed data. The service use [sentiment-al](https://github.com/armando1339/sentiment-al) gem to execute the Sentiment Analysis.

The control available has endpoints for track the processed texts. To access the routes call the #sentiment_tracker method into the route file. More information about the routes and request structure visit [Postman](https://documenter.getpostman.com/view/2691667/TVRn3Sen) documentation.

Example:

```ruby
# call method #sentiment_tracker:
# config/routes.rb

Rails.application.routes.draw do

  sentiment_tracker
end

```

Check routes.

```bach
rails routes
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sentiment_tracker', '~> 1.0.2beta'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install sentiment_tracker
```

Ones installed, generate migrations:

```bash
$ rails generate sentiment_tracker
```

Then:

```bash
$ rails db:migrate
```

## Contributing

Bug report or pull request are welcome.

Make a pull request:

- Clone the repo
- Create your feature branch
- Commit your changes
- Push the branch
- Create PR

Please write tests if necessary.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Be happy!
