class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.float :price, null: false, default: 0
      t.integer :quantity, null: false, default: 1

      t.belongs_to :order, index: true
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
