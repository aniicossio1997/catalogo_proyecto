# frozen_string_literal: true

module Backend
  class BuysController < BackendController
    before_action :set_buy, except: [
      :index
    ]
    before_action :set_context, except: [
      :index,
      :show
    ]
    def index
      @buys = Buy.all.decorate
    end

    def state_change_accepted
      if @buy.update(state: 'accepted')
        flash.now[:notice] = t('change_buy_accepted')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      redirect_context
    end

    def state_change_rejected
      if @buy.update(state: 'rejected')
        flash.now[:notice] = t('change_buy_rejected')
      else
        flash.now[:alert] = t('error_buy_change')
      end
      redirect_context
    end

    def show; end

    private

    def set_buy
      @buy = Buy.find(params[:id]).decorate
    end

    def set_context
      @context = params[:context]
    end

    def buy_params
      params.require(:buy).permit(:id, :context)
    end

    def redirect_context
      case @context
      when 'index_buy'
        respond_to do |format|
          format.js { render 'update_index.js.erb' }
          format.html { render :index }
        end
      when 'show_buy'
        respond_to do |format|
          format.js { render 'update_show.js.erb' }
          format.html { render :show }
        end
      end
    end
  end
end
