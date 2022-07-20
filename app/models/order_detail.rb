class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

   def total_price
    item.add_tax_price * amount
    # 小計
   end
end
