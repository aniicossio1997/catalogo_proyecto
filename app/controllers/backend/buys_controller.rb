# frozen_string_literal: true
module Backend
  class BuysController < BackendController
    #authorize_resource class: false
    before_action :set_buy, except: [
      :index
    ]

    def index
      authorize! :index, :backend_buy
      @buys = Buy.all.decorate
    end

    def state_change_accepted
<<<<<<< HEAD
      authorize! :state_change_accepted, :backend_buy
=======
>>>>>>> 93314b79b156d030da8c9b6999c8c588ac7b965a
      if @buy.update_state(:accepted)
        flash.now[:notice] = t('change_buy_accepted')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      @buy.decorate
    end

    def state_change_rejected
<<<<<<< HEAD
      authorize! :state_change_rejected, :backend_buy
=======
>>>>>>> 93314b79b156d030da8c9b6999c8c588ac7b965a
      if @buy.update_state(:rejected)
        flash.now[:notice] = t('change_buy_rejected')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      @buy.decorate
    end

    def show
      authorize! :show, :backend_buy
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
