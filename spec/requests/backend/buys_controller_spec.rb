require "rails_helper"

RSpec.describe "Backend::BuysController Requests", type: :request do
  let(:admin) { create(:admin) }

  describe 'with user logged in' do
    describe 'index' do
      it 'ok request' do
        sign_in admin
        get backend_buys_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'show' do
        subject { create(:buy) }
        it 'ok request' do
          sign_in admin
          get backend_buy_path(buy)
          expect(response).to render_template(:show)
          expect(response).to have_http_status(:ok)
        end
      end
  end
end