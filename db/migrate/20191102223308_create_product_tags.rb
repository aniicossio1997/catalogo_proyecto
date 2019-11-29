# frozen_string_literal: true

class CreateProductTags < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tags do |t|
      t.references :product, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
