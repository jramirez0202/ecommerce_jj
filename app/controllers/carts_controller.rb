class CartsController < ApplicationController
  before_action :authenticate_user!
  
    def update
      product_id = params[:cart][:product_id]
      quantity = params[:cart][:quantity]
  
      current_order.add_prodcut(product_id, quantity)
  
      redirect_to root_path, notice: "Product add to cart"
    end
  
    def show
      @order = current_order
    end
  
    def destroy
      
    end
  end