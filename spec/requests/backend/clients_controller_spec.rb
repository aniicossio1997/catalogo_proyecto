require "rails_helper"

RSpec.describe "Backend::ClientsController Requests", type: :request do
  let(:admin) { create(:admin) }
  
  describe 'with user logged in' do
    describe 'index' do
      it 'ok request' do
        sign_in admin
        get backend_clients_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
    describe '#destroy' do
      context 'when user has buys' do
        let!(:client) { create(:user, :user_client_with_buys) }
        before do
          sign_in admin
          delete backend_client_path(client, format: :js), xhr: true
        end
        it 'should not be removed' do
          expect(User.clients.count).to eq(1)
          expect(flash[:alert]).to eq(I18n.t(:invalid_destroy_with_buys))
        end
      end

      context 'when user has not buys' do
        subject { create(:user, profile: Profile.client.first) }
        it 'ok request' do
          sign_in admin
          delete backend_client_path(subject, format: :js), xhr: true
          expect(response.content_type).to eq('text/javascript')
          expect(response).to render_template(:destroy)
          expect(response).to have_http_status(:ok)
          expect(User.clients.count).to eq(0)
          expect(flash[:notice]).to eq(I18n.t(:action_without_errors, element: :cliente, action: :eliminado))

        end
      end
      end
    end

  end
  describe 'without user logged in' do
    context 'should not show index' do
      it 'fail request redirecto to sign_in' do
        get backend_clients_path
        expect(response).to redirect_to(user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
  end
