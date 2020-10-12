require 'rails_helper'

RSpec.describe TextsController, type: :controller do
  describe 'GET #show' do
    let :texts do
      service = SentimentTracker::Service.call params: action_create_params

      service.processed_texts
    end

    context 'status 200 ok' do
      before do

        get(
          :show,
          format: :json,
          params: { id: texts.last }
        )
      end

      it { expect(response).to be_successful }

      it { expect(response.content_type).to eq("application/json; charset=utf-8") }
    end

    context 'status not found' do
      before do
        get(
          :show,
          format: :json,
          params: { id: 1000 }
        )
      end

      it { expect(response).to be_not_found }
    end
  end
end