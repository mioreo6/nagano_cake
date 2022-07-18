class AddColumsToOderdetailss < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :order_id, :integer, null: false

    add_foreign_key :order_details, :orders
  end
end
