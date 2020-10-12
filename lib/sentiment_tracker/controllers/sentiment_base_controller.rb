class SentimentBaseController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_jbuilder

  def build_index_json(instances)
    json_builder.texts do
      json_builder.array! instances do |text|
        build_partial_json(text)
      end
    end
  end

  def build_show_json(instance)
    json_builder.text do
      build_partial_json(instance)
    end
  end

  def build_partial_json(instance)
    json_builder.call(
      instance,
      :id,
      :description,
      :created_at,
      :updated_at,
      :sentiment
    )

    json_builder.sentences do
      json_builder.array! instance.sentences do |sentence|
        json_builder.call(
          sentence,
          :id,
          :description,
          :created_at,
          :updated_at,
          :sentiment
        )
      end
    end
  end

  private

  def set_jbuilder
    self.class.send(:attr_accessor, :json_builder)
    instance_variable_set(:@json_builder, Jbuilder.new)
  end
end