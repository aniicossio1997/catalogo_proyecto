# frozen_string_literal: true

module Frontend
  class CartController < FrontendController
    def show; end

    def add_to_cart
      product_id = params[:id]
      @cart[product_id].nil? ? @cart[product_id] = 1 : @cart[product_id] += 1
      session[:cart] = @cart if session[:cart].nil?
      render 'add_to_cart'
    end
  end
end
