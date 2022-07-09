class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_details
  enum payment_method: { credit_card: 0, transfer: 1}
 # enum status: { waiting: 0, confirmation: 1, production: 2, preparation: 3, send: 4}


  def sum_price
      item.add_tax_price * order_details.amount
  end



  
end
