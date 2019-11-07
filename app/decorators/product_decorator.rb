class ProductDecorator < ApplicationDecorator
  delegate_all

  def image_principal
    images_principals = object.product_images.select do |img|  img.principal
    end
    images_principals.first.get_image
  end

  def errores
    message = ''
    object.errors.messages.each do |key, value|
      message += "· El campo #{key}, #{value[0]}"
    end
    message
  end

  def images_secondaries
    images_secondaries = object.product_images.reject do |img| img.principal 
    end
    images_secondaries.map(&:get_image)
  end

  def category_name
    object.category.name
  end
end