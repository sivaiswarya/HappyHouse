class HomeController < ApplicationController
  	def index

  	@categories = home_categories

    @products = home_products

    @cat_products = cat_allproducts
	end

    private

    def home_categories
  		sql = "Select * from Categories"
    	ActiveRecord::Base.connection.execute(sql)
  	end

  	def home_products
    	sql = "Select * from Products order by category_id" 
    	ActiveRecord::Base.connection.execute(sql)
  	end

  	def cat_allproducts
  		sql="Select * from Categories where name = '#{params[:category_id]}'"
  		ActiveRecord::Base.connection.execute(sql)
  	end

  end

