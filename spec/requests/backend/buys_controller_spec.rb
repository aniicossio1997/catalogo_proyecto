require "rails_helper"

RSpec.describe "Backend::BuysController Requests", type: :request do
  let(:admin) { create(:admin) }
  describe 'with user logged in' do
    before do
      sign_in admin
    end
    describe 'index' do
      it 'ok request' do
        get backend_buys_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'show' do
      let!(:client) { create(:user, profile: Profile.client.take) }
      let!(:product) { create(:product, :product_image_principal) }
      let!(:product_image) { create(:product_image, product: product) }
      let!(:buy) { create(:buy, state: :pending, user: client) }
     
     # let!(:item) { create_list(:item, 2, product: product, buy: buy) }
      it 'ok request' do
       
        get backend_buy_path(buy)
        expect(response).to render_template(:show)
        expect(response).to have_http_status(:ok)
      end
    end
    describe '#state_change_accepted' do 
      let!(:client) { create(:user, profile: Profile.client.take) }
      context 'when state pending' do
        subject { create(:buy, state: :pending, user: client) }
        it 'ok request' do
          put state_change_accepted_backend_buy_path(subject, format: :js), xhr: true
          expect(response.content_type).to eq('text/javascript')
          expect(response).to render_template(:state_change_accepted)
          expect(flash[:notice]).to eq(I18n.t(:action_without_errors,
            element: :Compra,
            action: :actualizada))
        end
      end
      context 'when state distinct pending' do
        subject { create(:buy, state: :accepted, user: client) }
        it 'ok request' do
          put state_change_accepted_backend_buy_path(subject, format: :js), xhr: true
          expect(response.content_type).to eq('text/javascript')
          expect(response).to render_template(:state_change_accepted)
          expect(flash[:alert]).to eq(I18n.t(:action_error,
            element: :Compra,
            action: :actualizada))
        end
      end
    end
    describe '#state_change_rejected' do
      let!(:client) { create(:user, profile: Profile.client.take) }
      context 'when state pending' do
        subject { create(:buy, state: :pending, user: client) }
        it 'ok request' do
          put state_change_rejected_backend_buy_path(subject, format: :js), xhr: true
          expect(response.content_type).to eq('text/javascript')
          expect(response).to render_template(:state_change_rejected)
          expect(flash[:notice]).to eq(I18n.t(:action_without_errors,
            element: :Compra,
            action: :actualizada))
        end
      end
      context 'when state distinct pending' do
        subject { create(:buy, state: :accepted, user: client) }
        it 'ok request' do
          put state_change_rejected_backend_buy_path(subject, format: :js), xhr: true
          expect(response.content_type).to eq('text/javascript')
          expect(response).to render_template(:state_change_rejected)
          expect(flash[:alert]).to eq(I18n.t(:action_error,
            element: :Compra,
            action: :actualizada))
        end
      end
    end
  end
end