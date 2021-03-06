require "rails_helper"

RSpec.describe "Frontend::BuysController Requests", type: :request do
  let(:client) { create(:client) }
  describe 'Action index' do
    context 'with user logged in' do
      it 'ok request' do
        sign_in client
        get buys_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
  end
  describe 'show' do
    let!(:buy) { create(:buy, :buy_with_user_items, user: client) }
    it 'ok request' do
      sign_in client
      get create_buys_path(buy)
      get buy_path(buy)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'Action create' do
    let(:product) { create(:product, :product_image_principal) }
    it 'ok request' do
      allow_any_instance_of(BuyManager).to receive(:create).and_return(true)
      sign_in client
      get create_buys_path(product)
      expect(response).to redirect_to(buys_path)
      expect(response).to have_http_status(:redirect)
    end

    it 'fail validation' do
      sign_in client
      get create_buys_path(product)
      expect(response).to redirect_to(cart_path)
      expect(response).to have_http_status(:redirect)
    end
  end
end
