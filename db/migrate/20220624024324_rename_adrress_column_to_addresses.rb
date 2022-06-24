class RenameAdrressColumnToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :adrress, :address

  end
end
