class AddUnitPriceToOrderDetail < ActiveRecord::Migration
  def change
    add_column :order_details, :unit_price, :decimal, precision: 12, scale: 3
  end
end
