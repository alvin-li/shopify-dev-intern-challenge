class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, unique: true
      t.decimal :price, null: false, precision: 8, scope: 2

      t.belongs_to :shop, index: true
      t.belongs_to :line_item, index: true

      t.timestamps
    end
  end
end
