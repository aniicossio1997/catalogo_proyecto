class ChangeCostToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :cost, :decimal, default: 0
  end
end
