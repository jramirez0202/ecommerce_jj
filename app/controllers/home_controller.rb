class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def name
    to_s
  end


end
