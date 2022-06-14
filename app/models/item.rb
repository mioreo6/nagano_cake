class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :customer, through: :cart_items
  has_many :orders, through: :order_details
  belongs_to :genre

  def add_tax_price
      (self.price * 1.10).round
  end
end
