# frozen_string_literal: true

class ProductBackendPresenter
  def initialize(params)
    @params = params
  end

  def products
    @products ||= Product.all.paginate(
                        page: @params[:page],
                        per_page: Config.first.per_page
                        )
                      .decorate
  end

  def filter
    @filter ||= ProductsFilter.new(filter_params)
  end

  private

  def filter_params
    if @params[:products_filter]
      @params.require(:products_filter).permit(:query, :category_id, :sort)
    else
      {}
    end
  end
end
