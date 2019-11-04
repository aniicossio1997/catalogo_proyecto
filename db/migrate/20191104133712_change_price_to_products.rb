class ChangePriceToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :decimal, default: 0
  end
end
