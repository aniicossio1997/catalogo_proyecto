# frozen_string_literal: true

module Frontend
  class CartController < FrontendController
    before_action :set_cart, only: %i[show edit]

    def show; end

    def edit; end

    private

    def set_cart
      @cart = session[:cart]
    end
  end
end
