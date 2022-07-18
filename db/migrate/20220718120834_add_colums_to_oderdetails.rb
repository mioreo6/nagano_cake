class AddColumsToOderdetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :item_id, :integer, null: false
    add_column :order_details, :customer_id, :integer, null: false
    add_column :order_details, :amount, :integer, null: false
    
    add_foreign_key :order_details, :items
 
  end
end
