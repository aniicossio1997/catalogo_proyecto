require 'rails_helper'

RSpec.describe "Frontend::CartController Requests", type: :request do
  describe 'Show' do
    it 'ok request' do
      get cart_path
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Adding to the cart' do
    let!(:product) { create(:product) }
    it 'ok request' do
      get add_product_to_cart(product)
      expect(response).to render_template(:add_to_cart)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'Removing from the cart' do
    let!(:product) { create(:product) }
    it 'ok request' do
      get add_product_to_cart(product)
      get remove_product_from_cart(product)
      expect(response).to render_template(:update_cart_notification)
      expect(response).to have_http_status(:ok)
    end

    it 'fail deleting' do
      get add_product_to_cart(product)
      get remove_product_from_cart(Faker::Number.between(from: 2, to: 10))
      expect(response).to render_template(:update_cart)
      expect(response).to have_http_status(:ok)
    end
  end
end
