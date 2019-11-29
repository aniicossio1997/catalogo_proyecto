# frozen_string_literal: true

module Frontend
  class BuysController < FrontendController
    def index
      @buys = current_user.buys
    end

    def show
      @buy = Buy.find(params[:id])
    end
  end
end
