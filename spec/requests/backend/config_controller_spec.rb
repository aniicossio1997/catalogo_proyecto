require 'rails_helper'

RSpec.describe "Backend::ConfigController Requests", type: :request do
  let(:admin) { create(:admin) }

  describe 'with user logged in' do
    describe 'edit' do
      subject { create(:config) }
      it 'ok request' do
        sign_in admin

        get edit_backend_configs_path(subject, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'new' do
      it 'ok request' do
        sign_in admin

        get new_backend_config_path(format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'update' do
      subject { create(:config) }
      it 'ok request' do
        sign_in admin

        params = {
          config: {
            per_page: Faker::Number.between(from: 1, to: 100)
          }
        }
        patch backend_config_path(subject, params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to redirect_to(backend_sliders_path)
        expect(response).to have_http_status(:ok)
      end
      it 'fail validation' do
        sign_in admin

        create(:config,)

        params = {
          config: {
            per_page: Faker::Number.between(from: -100, to: -1)
          }
        }
        patch backend_config_path(subject, params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'create' do
      subject { create(:config) }
      it 'ok request' do
        sign_in admin

        params = {
          config: {
            per_page: Faker::Number.between(from: 1, to: 100)
          }
        }
        patch backend_config_path(subject, params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to redirect_to(backend_sliders_path)
        expect(response).to have_http_status(:ok)
      end
      it 'fail validation' do
        sign_in admin

        create(:config,)

        params = {
          config: {
            per_page: Faker::Number.between(from: -100, to: -1)
          }
        }
        patch backend_config_path(subject, params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
