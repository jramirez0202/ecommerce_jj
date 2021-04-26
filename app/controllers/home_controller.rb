class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def name
    to_s
  end


end
