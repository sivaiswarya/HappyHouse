class PaymentInfosController < ApplicationController
  include ApplicationHelper

  def new
    @payment_info = PaymentInfo.new
  end

  def create
    create_payment
    @payment_info = get_payment
    if @payment_info.any?
      flash[:success] = "Card details successfully added."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Error adding card details."
      render 'new'
    end
  end

  def edit
    @payment_info = PaymentInfo.find_by(user_id: current_user.id)
  end

  def update
    update_payment
    redirect_to user_path(current_user)
  end

private

  def payment_params
    params.require(:payment_info).permit(:card_num, :expiration_date, :ccv)
  end

  def create_payment
    sql="INSERT INTO payment_infos (card_num, expiration_date, ccv, user_id) VALUES ('#{payment_params[:card_num]}', '#{payment_params[:expiration_date]}', '#{payment_params[:ccv]}', '#{current_user.id}')"
    ActiveRecord::Base.connection.execute(sql)
  end

  def get_payment
    sql = "Select * from payment_infos where user_id = '#{current_user.id}'"
    ActiveRecord::Base.connection.execute(sql)
  end

  def update_payment
    payment_info = PaymentInfo.find_by(user_id: current_user.id)
    sql = "UPDATE payment_infos SET card_num = '#{payment_params[:card_num]}', expiration_date = '#{payment_params[:expiration_date]}', ccv = '#{payment_params[:ccv]}' WHERE payment_infos.id = #{payment_info.id}"
    ActiveRecord::Base.connection.execute(sql)
  end
end