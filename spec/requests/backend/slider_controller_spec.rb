require 'rails_helper'

RSpec.describe "Backend::SliderController Requests", type: :request do
  let(:admin) { create(:admin) }

  describe 'with user logged in' do
    before do
      sign_in admin
    end
    describe '#index' do
      it 'ok request' do
        get backend_sliders_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#new' do
      it 'ok request' do
        get new_backend_slider_path(format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#edit' do
      subject { create(:slider) }
      it 'ok request' do
        get edit_backend_slider_path(subject, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#create' do      
      it 'ok request' do
        params = {
          slider: { name: Faker::Commerce.product_name }
        }

        post backend_sliders_path(params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:create)
        expect(response).to have_http_status(:ok)
      end

      it 'fail validation' do
        sign_in admin
        params = {
          slider: { name: '' }
        }
        post backend_sliders_path(params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#update' do
      subject { create(:slider) }
      it 'ok request' do
        params = {
          slider: {
            name: Faker::Commerce.product_name
          }
        }
        patch backend_slider_path(subject, params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:update)
        expect(response).to have_http_status(:ok)
      end
      it 'fail validation' do
        sign_in admin

        create(:slider, name: 'Slider ya creado')

        params = {
          slider: {
            name: 'Slider ya creado'
          }
        }
        patch backend_slider_path(subject, params: params, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:modal)
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#destroy' do
      subject { create(:slider) }
      it 'ok request' do
        delete backend_slider_path(subject, format: :js), xhr: true
        expect(response.content_type).to eq('text/javascript')
        expect(response).to render_template(:destroy)
        expect(response).to have_http_status(:ok)
      end
    end
  end
  describe 'without user logged in' do
    describe 'should not show index' do
      it 'fail request redirecto to sign_in' do
        get backend_sliders_path
        expect(response).to redirect_to(user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
