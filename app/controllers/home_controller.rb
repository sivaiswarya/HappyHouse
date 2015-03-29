class HomeController < ApplicationController
  def index
  	sql = "Select * from Categories"
    @categories = ActiveRecord::Base.connection.execute(sql)
  end
end
