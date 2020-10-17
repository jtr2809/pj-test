class AddForeignKeyToOrder < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :orders, :stores
  end
end
