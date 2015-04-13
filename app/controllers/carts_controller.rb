class CartsController < ApplicationController
  include ApplicationHelper
  
  def show
    @order_details = current_order.order_details
  end
end
