module Frontend
  class MainController < FrontendController
    
    def home
      @sliders = Slider.all
      @products = Product.limit(4).decorate
    end
  end
end
