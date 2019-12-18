# frozen_string_literal: true

module Backend
  class SlidersController < BackendController
    before_action :set_slider, only: %i[
      edit
      update
      destroy
    ]
    authorize_resource
    def index
      @sliders = Slider.all
      @config = Config.last
    end

    def new
      @slider = Slider.new
      render :modal
    end

    def edit
      render :modal
    end

    def create
      @slider = Slider.new(slider_params)
      if @slider.save
        flash.now[:notice] = t(:action_without_errors,
                               element: :Slider,
                               action: :creado)
      else
        flash.now[:alert] = t(:action_error,
                              element: :Slider,
                              action: :creado)
        
        render :modal
      end
    end

    def update
      if @slider.update(slider_params)
        flash.now[:notice] = t(:action_without_errors,
                               element: :Slider,
                               action: :creado)
      else
        flash.now[:alert] = t(:action_error,
                              element: :Slider,
                              action: :creado)
        render :modal
      end
    end

    def destroy
      @slider.destroy
      flash.now[:notice] = t(:action_without_errors,
                             element: :Slider,
                             action: :eliminado)
    end

    private

    def set_slider
      @slider = Slider.find(params[:id])
    end

    def slider_params
      params.require(:slider).permit(:name, :image)
    end
  end
end
