class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.decimal :total, precision: 12, scale: 3

      t.timestamps null: false
    end
    add_foreign_key :order_details, :products
    add_foreign_key :order_details, :orders
  end
end
