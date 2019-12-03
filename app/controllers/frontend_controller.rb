# frozen_string_literal: true

class FrontendController < ApplicationController
  before_action :set_cart

  private

  def set_cart
    @cart = session[:cart] || {}
  end
end
