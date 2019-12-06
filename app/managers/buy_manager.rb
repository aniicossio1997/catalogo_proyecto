# frozen_string_literal: true

class BuyManager
  attr_accessor :cart, :user

  def initialize(cart, user)
    @cart = cart
    @user = user
  end

  def create
    new_buy = Buy.new(user: @user)
    @cart.each do |product_id, count|
      product = Product.find(product_id)
      new_buy.items << Item.new(price: product.price,
               count: count,
               product: product,
               buy: new_buy)
    end
    @cart.clear
    new_buy.save
  end
end
