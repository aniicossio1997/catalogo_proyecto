# frozen_string_literal: true

class CartDecorator < ApplicationDecorator
  delegate_all

  def pretty_count
    h.print_badge(session[:cart].size).html_safe
  end
end
