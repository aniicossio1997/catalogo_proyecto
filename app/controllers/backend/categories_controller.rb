module Backend
  class CategoriesController < BackendController

    before_action :set_category, only: [
      :edit,
      :update,
      :destroy
    ]
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
      render :modal
    end

    def edit
      render :modal
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash.now[:notice] = 'Creado'
      else
        flash.now[:alert] = 'Error'
        render :modal
      end
    end

    def update
      if @category.update(category_params)
        flash.now[:notice] = 'Creado'
      else
        flash.now[:alert] = 'Error'
        render :modal
      end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
