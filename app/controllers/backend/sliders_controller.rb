module Backend
  class SlidersController < BackendController
    before_action :set_slider, only: [
      :edit,
      :update,
      :destroy
    ]
    def index
      @sliders = Slider.all
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
        flash.now[:notice] = 'Slider creado'
      else
        flash.now[:alert] = 'Error creando slider'
        render :modal
      end
    end

    def update
      if @slider.update(slider_params)
        flash.now[:notice] = 'slider modificada'
      else
        flash.now[:alert] = 'Error modificando slider'
        render :modal
      end
    end

    def destroy
      @slider.destroy
      flash.now[:notice] = 'Slider eliminado'
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
