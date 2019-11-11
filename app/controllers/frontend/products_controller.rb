module Frontend
  class ProductsController < FrontendController
    def index
      @presenter = ProductPresenter.new(params)
    end
    def show
      @product = Product.find(params[:id]).decorate
    end
  end
end
