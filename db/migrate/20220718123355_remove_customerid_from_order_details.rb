class RemoveCustomeridFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :customer_id, :integer
  end
end
