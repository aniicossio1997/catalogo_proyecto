class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :buys do |t|
      t.integer :state
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
