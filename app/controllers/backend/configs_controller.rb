module Backend
  class ConfigsController < BackendController

    def edit
      render :modal
    end

    def new
      @config = Config.first
      render :modal
    end

    def create
      if @config.update(config_params)
        flash.now[:notice] = '#Usar i18n'
        redirect_to backend_sliders_path
      else
        flash.now[:alert] = '#Usar i18n'
        render :modal
      end
    end

    def update
      if @config.update(config_params)
        flash.now[:notice] = '#Usar i18n'
        redirect_to backend_sliders_path
      else
        flash.now[:alert] = '#Usar i18n'
        render :modal
      end
    end

    private


    def config_params
      params.require(:config).permit(
        :logo,
        :per_page
      )
    end
  end
end
