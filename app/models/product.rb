class Product < ApplicationRecord
  belongs_to :shop
  has_many :line_items, dependent: :delete_all

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # @return [Float] - The product price converted from a BigDecimal to a float
  def value
    self.price.to_f
  end

end
