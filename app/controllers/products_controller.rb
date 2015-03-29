class ProductsController < ApplicationController
  def index
    @categories = get_categories

    @products = get_products
  end

  private

  def get_categories
    sql = "Select * from Categories"
    ActiveRecord::Base.connection.execute(sql)    
  end

  def get_products
    sql = "Select P.name, P.description, P.image, P.price from Products P, Categories C where P.category_id = C.id and C.name = '#{params[:category_id]}'"
    ActiveRecord::Base.connection.execute(sql)
  end
end
