class Product < ApplicationRecord
  belongs_to :shop
  belongs_to :line_item
end
