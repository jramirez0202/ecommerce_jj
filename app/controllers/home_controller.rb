class HomeController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @users = User.all

    if @scores.blank?
      @average_score = 0
    else
      @average_score = @scores.average(:rating).round(2)
    end
  end

  def name
    to_s
  end


end
