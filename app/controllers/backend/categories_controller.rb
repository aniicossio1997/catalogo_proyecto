module Backend
  class CategoriesController < BackendController
    authorize_resource
    before_action :set_category, only: [
      :show,
      :edit,
      :update,
      :destroy
    ]
    def index
      @categories = Category.all
    end

    def show; end

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
        flash.now[:notice] = t(:category_created_without_errors)
      else
        flash.now[:alert] = t(:category_creation_error)
        render :modal
      end
    end

    def update
      if @category.update(category_params)
        flash.now[:notice] = '#Usar i18n'
      else
        flash.now[:alert] = '#Usar i18n'
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
