# frozen_string_literal: true

class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :buys do |t|
      t.integer :state, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
