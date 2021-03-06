# frozen_string_literal: true

module Backend
  class ConfigsController < BackendController
    authorize_resource
    def edit
      render :modal
    end

    def new
      render :modal
    end

    def create
      update
    end

    def update
      if @config.update(config_params)
        flash.now[:notice] = t(:action_without_errors,
                               element: :Conifugración,
                               action: :actualizada)
        redirect_to backend_sliders_path
      else
        flash.now[:alert] = t(:action_error,
                            element: :Configuración,
                            action: :actualizada)
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
