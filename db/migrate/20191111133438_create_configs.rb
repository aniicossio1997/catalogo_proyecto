# frozen_string_literal: true

class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.integer :per_page

      t.timestamps
    end
  end
end
