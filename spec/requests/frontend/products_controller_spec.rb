require 'rails_helper'

RSpec.describe "Frontend::ProductsController Requests", type: :request do
  describe '#index' do
    it 'ok request' do
      get products_path
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'show' do
    let!(:product) { create(:product,:product_image_principal) }
    it 'ok request' do
      get product_path(product)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
end
