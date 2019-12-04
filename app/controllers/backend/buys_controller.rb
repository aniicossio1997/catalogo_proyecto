# frozen_string_literal: true
module Backend
  class BuysController < BackendController
    #authorize_resource class: false
    before_action :set_buy, except: [
      :index
    ]

    def index
      authorize! :index, :backendBuysController
      @buys = Buy.all.decorate
    end

    def state_change_accepted
<<<<<<< HEAD
      #authorize! :state_change_accepted, :backendBuysController
      if @buy.accepted!
=======
      if @buy.update_state(:accepted)
>>>>>>> 9018f40d4c13e01b99e0938501442cd3066ac312
        flash.now[:notice] = t('change_buy_accepted')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      @buy.decorate
    end

    def state_change_rejected
<<<<<<< HEAD
      #authorize! :state_change_rejected, :backendBuysController
      if @buy.rejected!
=======
      if @buy.update_state(:rejected)
>>>>>>> 9018f40d4c13e01b99e0938501442cd3066ac312
        flash.now[:notice] = t('change_buy_rejected')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      @buy.decorate
    end

    def show
      authorize! :show, :backendBuysController
    end

    private

    def set_buy
      @buy = Buy.find(params[:id]).decorate
    end

    def buy_params
      params.require(:buy).permit(:id)
    end
  end
end
