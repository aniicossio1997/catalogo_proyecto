require "rails_helper"

RSpec.describe "Frontend::BuysController Requests", type: :request do
  describe 'Action index' do
    it 'ok request' do
      get buys_path
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'Action show' do
    let!(:client) { create(:user, profile: Profile.client.take) }
    let!(:product) { create(:product) }
    #let!(:product_image) { create(:product_image, product: product) }
    let!(:buy) { create(:buy, state: :pending, user: client) }
    let!(:item) { create_list(:item, 2, product: product, buy: buy) }
    it 'ok request' do
      buys_path(buy)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
  describe 'Action create' do
    it 'ok request' do
      subject { create(:cart) } 
     # sign_in client
      post buys_path
      expect(response).to redirect_to(buys_path)
      expect(response).to have_http_status(:redirect)
    end
    it 'fail validation' do
      #sign_in client
      post create_buys_path(buy)
      expect(response).to redirect_to(cart_path)
      expect(response).to have_http_status(:redirect)
    end
  end
end

  #describe 'Action "show"' do
  #  it 'Render correct template' do
  #    get '/buys', params: { id: }
  #    expect(response).to render_template(:show)
  #  end
  #end

