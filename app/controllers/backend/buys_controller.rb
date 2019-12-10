# frozen_string_literal: true

module Backend
  class BuysController < BackendController
    # authorize_resource class: false
    before_action :set_buy, except: [
      :index
    ]

    def index
      authorize! :index, :backend_buy
      @buys = Buy.all.decorate
    end

    def state_change_accepted
      if @buy.update_state(:accepted)
        flash.now[:notice] = t(:action_without_errors,
                               element: :Compra,
                               action: :actualizada)
      else
        flash.now[:alert] = t(:action_error,
                              element: :Compra,
                              action: :actualizada)
      end
      @buy.decorate
    end

    def state_change_rejected
      if @buy.update_state(:rejected)
        flash.now[:notice] = t(:action_without_errors,
                               element: :Compra,
                               action: :actualizada)
      else
        flash.now[:alert] = t(:action_error,
                              element: :Compra,
                              action: :actualizada)
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
