# frozen_string_literal: true

module Backend
  class CategoriesController < BackendController
    authorize_resource
    before_action :set_category, only: %i[
      show
      edit
      update
      destroy
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
        flash.now[:notice] = t(:action_without_errors,
                               element: :Categoría,
                               action: :creada)
      else
        flash.now[:alert] =  t(:action_error,
                               element: :Categoría,
                               action: :creada)
        render :modal
      end
    end

    def update
      if @category.update(category_params)
        flash.now[:notice] = t(:action_without_errors,
                               element: :Categoría,
                               action: :creada)
      else
        flash.now[:alert] = t(:action_error,
                              element: :Categoría,
                              action: :creada)
        render :modal
      end
    end

    def destroy
      @category.destroy
      if @category.errors.present?
        flash[:alert] = @category.errors.full_messages.first
      else
        flash[:notice] = t(:action_without_errors,
                           element: :Categoría,
                           action: :eliminada)
      end
      redirect_to backend_categories_path
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
