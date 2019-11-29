module Backend
  class BuysController < BackendController
    before_action :set_buy, except: [
      :index
    ]
    def index
      @buys = Buy.all.decorate
    end

    def state_change_accepted
      # @buy.change_accepted_status
      # @buy.save
      if @buy.update(state: 'accepted')
        flash.now[:notice] = t('change_buy_accepted')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      respond_to do |format|
        format.js { render 'update.js.erb' }
        format.html { render :index }
      end

    end

    def state_change_rejected
      if @buy.update(state: 'rejected')
        flash.now[:notice] = t('change_buy_rejected')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      respond_to do |format|
        format.js { render 'update.js.erb' }
        format.html { render :index }
      end
    end

    def show;end

    private

    def set_buy
      @buy = Buy.find(params[:id]).decorate
    end

    def buy_params
      params.require(:buy).permit(:id)
    end
  end
end
