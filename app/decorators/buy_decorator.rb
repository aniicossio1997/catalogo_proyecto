# frozen_string_literal: true

class BuyDecorator < ApplicationDecorator
  delegate_all

  def client
    object.user.username
  end

  def pretty_price_total
    h.print_badge(h.number_to_currency(object.total_buy)).html_safe
  end

  def date
    object.created_at.strftime("%Y/%m/%d %H:%M:%S")
  end

  def state_pretty
    I18n.t(object.state)
  end
end
