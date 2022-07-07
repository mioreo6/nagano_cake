class Address < ApplicationRecord
  belongs_to :customer

  def add_address
    "〒" + self.postal_code + " "  + self.address + "　" + self.name
  end
end
