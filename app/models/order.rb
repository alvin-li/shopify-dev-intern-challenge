class Order < ApplicationRecord
  belongs_to :shop
  has_many :line_items

  # @return [Float] - The sum of the values of an order's line items
  def total_value
    line_items.to_a.sum { |item| item.product.value }
  end
end
