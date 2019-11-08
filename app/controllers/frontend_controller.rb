class FrontendController < ApplicationController
  before_action :set_category

  private

  def set_category
    @categories = Category.all
  end
end
