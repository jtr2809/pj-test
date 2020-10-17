class AddStoreToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :store
  end
end
