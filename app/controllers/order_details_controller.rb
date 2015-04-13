class OrderDetailsController < ApplicationController
  include ApplicationHelper

  def create
    @order = current_order
    @order_details = @order.order_details.new(order_detail_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to request.referer
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update_attributes(order_detail_params)
    @order_details = @order.order_details
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = @order.order_details
    redirect_to cart_path
  end

private

  def order_detail_params
    params.require(:order_detail).permit(:quantity, :product_id)
  end
end
