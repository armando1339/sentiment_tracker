class Sentence < ActiveRecord::Base

  # => Associations
  belongs_to :text, touch: true
  has_one :sentiment, as: :entity, dependent: :destroy

  # => Validations
  validates_presence_of :description

  # => Nested
  accepts_nested_attributes_for :sentiment
end