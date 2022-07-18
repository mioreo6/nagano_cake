class AddColumsToOderdetail < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :price, :integer, null: false
    add_column :order_details, :is_active, :boolean, null: false, default: 0
  end
end
