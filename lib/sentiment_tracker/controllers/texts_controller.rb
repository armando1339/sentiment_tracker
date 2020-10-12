class TextsController < SentimentBaseController
  before_action :set_text, only: %i(show update destroy)

  def index
    render json: build_index_json(Text.includes(:sentences, :sentiment).all), status: :ok
  end

  def show
    render json: build_show_json(@text), status: :ok
  end

  def create
    service = SentimentTracker::Service.call params: params
    
    if service.success?
      render(
        json: build_index_json(service.processed_texts),
        status: :ok
      )
    end
  end

  def destroy
    @text.destroy
  end

  private

  def set_text
    @text = Text.includes(:sentences, :sentiment).find params.fetch(:id)
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def text_params
    params.permit data_processable: [:description]
  end
end