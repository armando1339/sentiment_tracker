require 'rails_helper'

RSpec.describe TextsController, type: :controller do
  describe 'GET #index' do
    context 'status 200' do
      before do
        SentimentTracker::Service.call params: action_create_params

        get :index, format: :json
      end

      it { expect(response).to be_successful }

      it { expect(response.content_type).to eq("application/json; charset=utf-8") }

      it 'return an collection' do
        expect(Text.last(4).size).to be > 0
      end
    end
  end
end