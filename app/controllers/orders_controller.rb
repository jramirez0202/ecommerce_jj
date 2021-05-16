class OrdersController < ApplicationController
  def destroy
    @order = Order.find(params[:id])
    current_order.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end

    
  end

  def edit
  end

  def update
  end
end
