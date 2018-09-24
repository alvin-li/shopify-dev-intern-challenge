class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :total_price, null: false, default: 0
      t.belongs_to :shop, index: true

      t.timestamps
    end
  end
end
