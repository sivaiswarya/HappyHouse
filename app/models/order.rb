class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_details
  before_create :set_order_status
  before_save :update_subtotal
  before_save :update_shipping

  def subtotal
    order_details.collect { |order_detail| order_detail.valid? ? (order_detail.quantity * order_detail.unit_price) : 0 }.sum
  end

  def total
    self.subtotal + self.shipping_cost
  end

private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def update_shipping
    self[:shipping_cost] = 10
  end
end
