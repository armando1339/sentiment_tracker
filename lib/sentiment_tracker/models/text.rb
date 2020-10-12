class Text < ActiveRecord::Base

  # => Associations
  belongs_to :entity, polymorphic: true, optional: true
  has_one :sentiment, as: :entity, dependent: :destroy
  has_many :sentences, dependent: :destroy

  # => Callbacks
  after_create :exec_sentiment_analysis

  # => Validations
  validates_presence_of :description

  # => Nested
  accepts_nested_attributes_for :sentences, :sentiment

  # => Execute the request to SENTIM-API
  # and process the responces creating
  # some trackeable data
  #
  def exec_sentiment_analysis
    sentiment_al.call text: description

    create_tracking! if sentiment_al.successfully?
  end

  private

  # => *
  def create_tracking!
    update(
      sentences_attributes: build_track_params,
      sentiment_attributes: build_result_params
    )
  end

  # => *
  def build_track_params
    sentiment_al.response_to_hash.fetch('sentences').each do |sentence|
      sentence.transform_keys!{ |key| keys_map[key] }
      sentence.fetch('sentiment_attributes').transform_keys!{ |key| keys_map[key] }
    end
  end

  # => *
  def build_result_params
    sentiment_al.response_to_hash.fetch('result').transform_keys!{ |key| keys_map[key] }
  end

  # => *
  def keys_map
    {
      'sentence' => 'description',
      'sentiment' => 'sentiment_attributes',
      'type' => 'kind',
      'polarity' => 'polarity'
    }
  end
end