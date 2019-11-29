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
        flash.now[:notice] = '#Usar i18n'
      else
        flash.now[:alert] = '#Usar i18n'
      end
      respond_to do |format|
        format.js { render 'update.js.erb' }
        format.html { render :index }
      end

    end

    def state_change_rejected
      if @buy.update(state: 'rejected')
        flash.now[:notice] = '#Usar i18n'
      else
        flash.now[:alert] = '#Usar i18n'
      end
      respond_to do |format|
        format.js { render 'update.js.erb' }
        format.html { render :index}
      end
    end

    private

    def set_buy
      @buy = Buy.find(params[:id])
    end

    def buy_params
      params.require(:buy).permit(:id)
    end
  end
end
