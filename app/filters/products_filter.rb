class ProductsFilter
  include ActiveModel::Model
  SORT_VALID_VALUES ||= [
    'asc',
    'desc',
    'ASC',
    'DESC'
  ].freeze
  attr_accessor :query, :category_id, :sort

  def initialize(params)
    @query = params[:query]
    @category_id = params[:category_id]
    @sort = params[:sort]
  end

  def call
    products = Product.all
    # byebug
    products = products.sort_name(@sort) if @sort.present? && sort_valid?
    products = products.with_name(@query) unless @query.blank?
    products = products.with_category(@category_id) unless @category_id.blank?
    products
  end
  private

  def sort_valid?
    SORT_VALID_VALUES.include?(@sort)
  end
end
