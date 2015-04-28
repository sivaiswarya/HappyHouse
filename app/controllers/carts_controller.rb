class CartsController < ApplicationController
  include ApplicationHelper
  include SessionsHelper
  skip_before_action :verify_authenticity_token, only: :confirm
  
  def show
    @order_details = current_order.order_details
  end

  def checkout
    @order = current_order
    @card_info = PaymentInfo.find_by(user_id: current_user)
  end

  def confirm
    current_order.order_status_id = 2
    current_order.save
    session.delete(:order_id)
    flash[:success] = "Order successfully placed"
    redirect_to root_path
  end
end
