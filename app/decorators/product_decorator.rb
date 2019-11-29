# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  delegate_all

  def image_principal
    images_principals = object.product_images.select(&:principal)
    images_principals.first.image_attached
  end

  def errores
    object.errors.full_messages.join("\n").html_safe
  end

  def images_secondaries
    images_secondaries = object.product_images.principals
    images_secondaries.map(&:image_attached)
  end

  def category_name
    object.category.name
  end

  def tags_name
    object.tags
          .pluck(:name)
          .map { |t| h.print_badge(t) }
          .join
          .html_safe
  end

  def pretty_price
    h.print_badge(h.number_to_currency(object.price)).html_safe
  end

  def pretty_cost
    h.print_badge(h.number_to_currency(object.cost)).html_safe
  end
end
