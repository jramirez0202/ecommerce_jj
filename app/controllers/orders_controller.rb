class OrdersController < ApplicationController

  def destroy
    # @order = current_order
    # @order_item = @order.order_items.find(params[:id])
    # @order_item.destroy
    # @order_items = current_order.order_items
    # redirect_to carts_path
    @order = Order.find(params[:id])
    current_order.destroy
    respond_to do |format|
      format.html { redirect_to cart_path, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end
