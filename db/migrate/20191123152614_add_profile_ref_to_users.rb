class AddProfileRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :profile, index: true
  end
end
