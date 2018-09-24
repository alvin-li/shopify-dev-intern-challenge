class Product < ApplicationRecord
  belongs_to :shop
  has_many :line_items, dependent: :delete_all

  validates :price, numericality: { greater_than_or_equal_to: 0 }

end
