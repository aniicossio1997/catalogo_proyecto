# frozen_string_literal: true
class Cart
  attr_accessor :cart
  def initialize(cart)
    @cart = cart
  end

  def size
    @products.size
  end

  def total_products
    suma = 0
    @cart.each { |product, count| suma = suma + count}
    suma
  end

  def price_total
    total = 0
    @cart.each { | id_product, count | total += Product.find(id_product).price * count }
    total
  end
end
