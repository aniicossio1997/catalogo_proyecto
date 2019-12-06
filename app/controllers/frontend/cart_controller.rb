# frozen_string_literal: true
module Frontend
  class CartController < FrontendController
    #before_action :authorize_cart
    before_action :set_product_id, only: [:add_to_cart, :remove_from_cart]
    
    def show; end

    def add_to_cart
      product_id = params[:id]
      if @cart[product_id].nil?
        @cart[product_id] = 1
      else
        @cart[product_id] += 1
      end
      render 'update_cart_notification'
    end

    def authorize_cart
      authorize! :authorize_cart, :frontend_cart
    end

    def remove_from_cart
      @cart.delete(params[:id])
      render 'update_cart'
    end

    private

    def set_product_id
      @product_id = params[:id]
    end
  end
end
