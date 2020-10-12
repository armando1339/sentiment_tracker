class Sentiment < ActiveRecord::Base

  # => Associations
  belongs_to :entity, polymorphic: true

  # => Validations
  validates_presence_of :polarity, :kind
end