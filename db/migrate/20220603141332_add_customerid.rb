class AddCustomerid < ActiveRecord::Migration[6.1]
  def change
     add_foreign_key :addresses, :customers
  end
end
