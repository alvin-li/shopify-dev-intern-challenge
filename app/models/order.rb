class Order < ApplicationRecord
  belongs_to :shop
  has_many :line_items

  def update_total_price
    self.total_price = line_items.to_a.sum { |item| item.price }
    save
  end
end
