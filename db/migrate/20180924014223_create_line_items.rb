class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity, null: false, default: 1

      t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
