# frozen_string_literal: true

module Frontend
  class MainController < FrontendController
    #before_action :authorize_home
    def home
      @sliders = Slider.all
      @products = Product.actives.order("RAND()").limit(4).decorate
    end
  end
end
