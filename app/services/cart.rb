# frozen_string_literal: true

class Cart
  def initialize
    @products = []
  end

  def add_product(product, count = 0)
    @products << { product: product, count: count }
  end

  def remove_product(product)
    @products.select { |prod| prod[:product].id == product.id }
  end
end
