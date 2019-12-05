# frozen_string_literal: true

module Frontend
  class ProductsController < FrontendController
    #before_action :authorize_product
    def index
      @presenter = ProductPresenter.new(params)
    end

    def show
      @product = Product.find(params[:id]).decorate
    end
  end
end
