require 'rails_helper'

RSpec.describe TextsController, type: :controller do
  describe 'POST #create' do

    let :params do
      action_create_params
    end

    context 'status 200 ok' do
      before do

        post(
          :create,
          format: :json,
          params: params
        )
      end

      it { expect(response).to be_successful }

      it { expect(response.content_type).to eq("application/json; charset=utf-8") }

      it 'return an collection' do
        expect(Text.last(4).size).to be > 0
      end
    end
  end
end