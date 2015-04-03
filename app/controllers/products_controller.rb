class ProductsController < ApplicationController
  def index
    @categories = get_categories

    @products = get_products
  end

  def show
    @product = get_product
  end

  private

  def get_categories
    sql = "Select * from Categories"
    ActiveRecord::Base.connection.execute(sql)    
  end

  def get_products
    sql = "Select P.name, P.description, P.image, P.price, P.id from Products P, Categories C where P.category_id = C.id and C.name = '#{URI::decode(params[:category_id])}'"
    ActiveRecord::Base.connection.execute(sql)
  end

  def get_product
    sql = "Select name, description, image, price from Products where id = '#{params[:id]}'"
    ActiveRecord::Base.connection.exec_query(sql)
  end
end
