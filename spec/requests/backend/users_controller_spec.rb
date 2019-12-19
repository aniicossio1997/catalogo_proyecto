require "rails_helper"

RSpec.describe "Backend::UsersController Requests", type: :request do
  let(:admin) { create(:admin) }
  describe 'with user logged in' do
    before do
      sign_in admin
    end
    describe '#index' do
      it 'ok request' do
        get backend_users_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
    describe '#new' do
      it 'ok request' do
        get new_backend_user_path
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
    end
    describe '#create' do
      context 'when valid parameters' do
        it 'ok request' do
          params = {
            user: {
              email: 'prueba@prueba.com',
              username: 'prueba'
            }
          }
          expect(User.admins.count).to eq(1)
          post backend_users_path(params)
          expect(response).to redirect_to backend_users_path
          expect(response).to have_http_status(:found)
          expect(User.admins.count).to eq(2)
        end
      end
      context 'when invalid parameters' do
        subject { build(:user, profile: Profile.client.last) }
        it 'ok rejected' do
          params = {
            user: {
              username: subject.username
            }
          }
          expect(User.admins.count).to eq(1)
          post backend_users_path(params)
          expect(response).to render_template(:new)
          expect(response).to have_http_status(:ok)
          expect(User.admins.count).to eq(1)
        end
      end
    end
    describe '#edit' do
      subject { create(:user, profile: Profile.client.last) }
      it 'ok request' do
        get edit_backend_user_path(subject)
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:ok)
      end
    end
    describe '#update' do
      subject { create(:user, profile: Profile.admin.first) }
      it 'ok request' do
        params = {
          user: {
            email: 'other@gmail.com',
            username: subject.username
          }
        }
        patch backend_user_path(subject, params)
        expect(response).to redirect_to backend_users_path
        expect(response).to have_http_status(:found)
      end
    end
    describe '#destroy' do
      context 'when user admin delete other user admin' do
        let!(:other_admin) { create(:user, profile: Profile.admin.first) }
        it 'ok request' do
          expect(User.admins.count).to eq(2)
          delete backend_user_path(other_admin, format: :js), xhr: true
          expect(User.admins.count).to eq(1)
          expect(flash[:notice]).to eq(I18n.t(:action_without_errors,
            element: :Usuario,
            action: :eliminado))
        end
      end
      context 'when user admin deletes himself' do
        it 'ok request' do
          expect(User.admins.count).to eq(1)
          delete backend_user_path(admin, format: :js), xhr: true
          expect(User.admins.count).to eq(1)
          expect(flash[:alert]).to eq(I18n.t(:action_error,
            element: :Usuario,
            action: :eliminado))
        end
      end
    end
  end
  describe 'without user logged in' do
    describe 'should not show index' do
      it 'fail request redirecto to sign_in' do
        get backend_users_path
        expect(response).to redirect_to(user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
    describe 'should not show new' do
      it 'fail request redirecto to sign_in' do
        get new_backend_user_path
        expect(response).to redirect_to(user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
