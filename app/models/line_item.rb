class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  after_create :update_price

  private

  def update_price
    self.price = product.price * self.quantity
    save
    order.update_total_price
  end

end
