# frozen_string_literal: true
module Frontend
  class BuysController < FrontendController
    before_action :authorize_buy_client_logged

    def index
      @buys = current_user.buys
    end

    def show
      @buy = Buy.find(params[:id]).decorate
    end

    def create
      buy_manager = BuyManager.new(@cart, current_user)

      if buy_manager.create
        flash.now[:notice] = t(:buy_created_without_errors)
        redirect_to buys_path
      else
        flash.now[:alert] = t(:buy_created_without_errors)
        redirect_to cart_path
      end
    end

    private

    def authorize_buy_client_logged
      authorize! :authorize_buy_user_logged, :frontend_buy
    end
  end
end
