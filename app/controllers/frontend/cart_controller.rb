# frozen_string_literal: true

module Frontend
  class CartController < FrontendController
    before_action :set_cart, only: [ :show ]

    def show; end

    private

    def set_cart
      @cart = session[:cart] || {}
    end
  end
end
