class CartsController < ApplicationController
  before_action :authenticate_user!
  
    def update
      product_id = params[:cart][:product_id]
      quantity = params[:cart][:quantity]
  
      current_order.add_product(product_id, quantity)
  
      redirect_to root_path, notice: "Product add to cart"
    end
  
    def show
      @order = current_order
    end
  
    def destroy
      @order.destroy
      respond_to do |format|
      format.json {head :no_content}
      format.js
      end
    end
  end