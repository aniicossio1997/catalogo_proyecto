module Backend
  class ProductsController < BackendController

    before_action :set_product, only: [
      :show,
      :edit,
      :update,
      :destroy
    ]

    def index
      @products = Product.all
    end

    def show; end

    def new
      @product = Product.new
    end

    def edit; end

    def create
      @product = Product.new(product_params)
      if @product.save
        flash.now[:notice] = 'Producto creado'
        redirect_to backend_products_path
      else
        flash.now[:alert] = 'Error creando producto'
        render :new
      end
    end

    def update
      if @product.update(product_params)
        flash.now[:notice] = 'Producto modificada'
        redirect_to backend_products_path
      else
        flash.now[:alert] = 'Error modificando producto'
        render :edit
      end
    end

    def destroy
      @product.destroy
      flash[:notice] = 'Producto eliminado'
      redirect_to backend_products_path
    end

    private

<<<<<<< Updated upstream
=======
    def authorize_product
      authorize! :authorize_product, :backend_product
    end

>>>>>>> Stashed changes
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :name,
        :description,
        :active,
        :price,
        :cost,
        :category_id,
        tag_ids: [],
        product_images_attributes: [
          :id,
          :image,
          :_destroy
        ]
      )
    end
  end
end
