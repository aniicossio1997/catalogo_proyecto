# frozen_string_literal: true
module Frontend
  class CartController < FrontendController
    #before_action :authorize_cart
    def show; end

    def add_to_cart
      product_id = params[:id]
      if @cart[product_id].nil?
        @cart[product_id] = 1
      else
        @cart[product_id] += 1
      end
      render 'add_to_cart'
    end

    def authorize_cart
      authorize! :authorize_cart, :frontend_cart
    end
  end
end
