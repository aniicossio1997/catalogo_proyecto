module Frontend
  class ProductController < FrontendController
    def index
      @products = Product.all
    end
    def show
      @product = Product.find(params[:id])
    end
  end
end
