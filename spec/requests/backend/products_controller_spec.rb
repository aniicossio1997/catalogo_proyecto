require "rails_helper"

RSpec.describe "Backend::ProductsController Requests", type: :request do
  let(:admin) { create(:admin) }

  describe 'with user logged in' do
    describe 'index' do
      it 'ok request' do
        sign_in admin

        get backend_products_path
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'new' do
      it 'ok request' do
        sign_in admin

        get new_backend_product_path
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'edit' do
      subject { create(:product, :product_image_principal) }
      it 'ok request' do
        sign_in admin

        get edit_backend_product_path(subject.id)
        expect(response).to render_template(:edit)
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'create' do
      it 'ok request' do
        sign_in admin
        file =  fixture_file_upload(Rails.root.join('app/assets/images/missing.png'), 'images/png')

        # params = ActionController::Parameters.new(
        #   {
        #     product: {
        #     name: Faker::Name.unique.name,
        #     description: Faker::Lorem.sentence,
        #     price: Faker::Number.decimal(l_digits: 3, r_digits: 3),
        #     cost: Faker::Number.decimal(l_digits: 3, r_digits: 3),
        #     active: Faker::Boolean.boolean,
        #     code: Faker::Code.nric(min_age: 27, max_age: 34),
        #     category_id: rand(1000),
        #     tags_id: [],
        #     product_images_attributes: {
        #       '0': {
        #         principal: true,
        #         image: file,
        #         _destroy: false
        #       }
        #     }
        #   }
        # }
        # )
        params = {
          product: {
            name: Faker::Name.unique.name,
            description: Faker::Lorem.sentence,
            price: Faker::Number.decimal(l_digits: 3, r_digits: 3), 
            cost: Faker::Number.decimal(l_digits: 3, r_digits: 3),
            active: Faker::Boolean.boolean,
            code: Faker::Code.nric(min_age: 27, max_age: 34),
            category_id: rand(1000),
            tags_id: [],
            product_images_attributes: {
              "0": {
                id: nil,
                image: 'asdasdsadsdasd',
                principal: true,
                _destroy: false
              }
            }
            # product_images_attributes: {
            #   '0': {
            #     image: file,
            #     principal: 1,
            #     _destroy: false
            #   }
            # }
          }
        }
        post backend_products_path(params: params)
        expect(response).to redirect_to(backend_products_path)
        expect(response).to have_http_status(:redirect)
      end
      it 'fail validation' do
        sign_in admin

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

#     describe 'update' do
#       subject { create(:category) }
#       it 'ok request' do
#         sign_in admin

#         params = {
#           product: {
#             name: Faker::Name.unique.name
#           }
#         }
#         patch backend_product_path(subject.id)
#         expect(response).to render_template(:update)
#         expect(response).to have_http_status(:ok)
#       end
#       it 'fail validation' do
#         sign_in admin

#         params = {
#           category: {
#             name: ''
#           }
#         }
#         patch backend_product_path(subject.id)
#         expect(response).to render_template(:edit)
#         expect(response).to have_http_status(:ok)
#       end
#     end
  #   describe 'destroy' do
  #     subject { create(:product) }
  #     it 'ok request' do
  #       sign_in admin

  #       params = {
  #         product: {
  #           name: Faker::Name.unique.name
  #         }
  #       }
  #       delete backend_product_path(subject.id)
  #       expect(response).to render_template(:idex)
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end
  # end

  # describe 'without user logged in' do
  #   describe 'index' do
  #     it 'fail request redirecto to sign_in' do
  #       get backend_products_path
  #       expect(response).to redirect_to(user_session_path)
  #       expect(response).to have_http_status(:found)
  #     end
  #   end
  end
end