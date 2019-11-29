class BuyDecorator < ApplicationDecorator
  delegate_all

  def client
    object.user.username
  end

  def pretty_price
    h.print_badge(h.number_to_currency(object.total_buy)).html_safe
  end

  def date
    object.created_at.strftime("%A, %B %e")
  end
end
