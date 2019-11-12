module Backend
  class ConfigsController < BackendController

    def edit
      render :modal
    end

    def new
      @config = Config.instance
      render :modal
    end

    def create
      if @config.update(config_params)
        flash.now[:notice] = 'Config created'
        redirect_to backend_sliders_path
      else
        flash.now[:alert] = 'Error creando configuración'
        render :modal
      end
    end

    def update
      if @config.update(config_params)
        flash.now[:notice] = 'Config updated'
        redirect_to backend_sliders_path
      else
        flash.now[:alert] = 'Error updating config'
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
