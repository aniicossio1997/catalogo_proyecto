class ProductPresenter
  def initialize(params)
    @params = params
  end

  def products
    @products ||= filter.call.decorate
  end

  def filter
    @filter ||= ProductsFilter.new(filter_params)
  end

  private

  def filter_params
    @params[:products_filter] ? @params.require(:products_filter).permit(:query, :category_id, :sort) : {}
  end
end
