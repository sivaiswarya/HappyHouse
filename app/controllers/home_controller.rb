class HomeController < ApplicationController
    def index

      @categories = home_categories

      @products = home_products
  end

    private

    def home_categories
      sql = "Select * from Categories"
      ActiveRecord::Base.connection.execute(sql)
    end

    def home_products
      sql = "Select P.id, P.name, P.description, P.image, P.price, C.name, P.category_id from Products P, Categories C where P.category_id = C.id order by P.category_id"
      ActiveRecord::Base.connection.execute(sql)
    end
  end

