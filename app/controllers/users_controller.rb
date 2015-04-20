class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @card_info = get_card_info(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully created your account!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def get_card_info(user)
    sql = "Select * from payment_infos where user_id = '#{user.id}'"
    ActiveRecord::Base.connection.execute(sql)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation)
  end
end
