# frozen_string_literal: true

class AddPrincipalToProductImage < ActiveRecord::Migration[5.2]
  def change
    add_column :product_images, :principal, :boolean
  end
end
