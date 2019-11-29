# frozen_string_literal: true

class BuyDecorator < ApplicationDecorator
  delegate_all

  def product_name
    object.product.name
  end

  def pretty_price_total
    h.print_badge(h.number_to_currency(object.total_price)).html_safe
  end
end
