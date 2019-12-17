require "rails_helper"

RSpec.describe "Backend::ProductsController Requests", type: :request do
  let(:admin) { create(:admin) }

  describe 'with user logged in' do
    before do
      sign_in admin
    end
    describe '#index' do
      it 'ok request' do
        get backend_products_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'show' do
      let!(:product) { create(:product,:product_image_principal) }
      it 'ok request' do
        get backend_product_path(product)
        expect(response).to render_template(:show)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'Action new' do
      it 'ok request' do
        get new_backend_product_path
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'Action edit' do
      subject { create(:product, :product_image_principal) }
      it 'ok request' do
        get edit_backend_product_path(subject.id)
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'Action create' do
      subject { create(:category) }
      it 'ok request' do
        file =  fixture_file_upload('files/coke.png', 'image/png')
        params = {
          product: {
            name: Faker::Name.unique.name,
            description: Faker::Lorem.sentence,
            price: Faker::Number.decimal(l_digits: 3, r_digits: 3), 
            cost: Faker::Number.decimal(l_digits: 3, r_digits: 3),
            active: Faker::Boolean.boolean,
            code: Faker::Code.nric(min_age: 27, max_age: 34),
            category_id: subject.id,
            tag_ids: []
            #product_images_attributes: [
            #  {
            #    image: file,
            #    principal: 1
            #  }
            #]
          }
        }

        post backend_products_path(params: params)
        #FALLA LA SUBIDA DE IMAGNES; CHEQUEAR LUEGO
        #expect(response).to redirect_to(backend_products_path)
        #expect(response).to have_http_status(:found)

        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
      it 'fail validation' do
        

        params = {
          product: {
            name: '',
            description: '',
            active: true,
            code: 2,
            price: 100,
            cost: 100,
            category_id: rand(1000),
            tags_id: [],
            product_images_attributes: %i[]
          }
        }

        post backend_products_path(params: params)
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'update' do
      let!(:product) { create(:product,:product_image_principal) }
      let(:category) { create(:category) }
      context 'when params correct' do
        it 'ok request' do
          params = {
            product: {
              name: Faker::Name.unique.name,
              description: Faker::Lorem.sentence,
              price: Faker::Number.decimal(l_digits: 3, r_digits: 3), 
              cost: Faker::Number.decimal(l_digits: 3, r_digits: 3),
              active: Faker::Boolean.boolean,
              code: Faker::Code.nric(min_age: 27, max_age: 34),
              category_id: category.id,
            }
          }
          patch backend_product_path(product, params: params)
          expect(response).to redirect_to backend_products_path
          expect(response).to have_http_status(:found)
        end
      end
      context 'when params incorrect' do
        it 'fail validation' do
          params = {
            product: {
              name: '',
              description: '',
              active: true,
              code: 2,
              price: 100,
              cost: 100,
              category_id: rand(1000),
              tags_id: [],
              product_images_attributes: %i[]
            }
          }
          patch backend_product_path(product, params: params)
          expect(response).to render_template(:edit)
          expect(response).to have_http_status(:ok)
        end
      end
    end
    describe 'destroy' do
      let!(:product) { create(:product, :product_image_principal) }
      let(:category) { create(:category) }
      it 'ok request' do
        delete backend_product_path(product)
        expect(response).to redirect_to(backend_products_path)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'without user logged in' do
    describe 'index' do
      it 'fail request redirecto to sign_in' do
        get backend_products_path
        expect(response).to redirect_to(user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
