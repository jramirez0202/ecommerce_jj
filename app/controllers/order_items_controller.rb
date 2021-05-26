class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params) 
    # && @record = @order.records.new(order_params)
    @order.save
    session[:order_id] = @order.id
    
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_item = current_order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_to cart_path
  end


  private

  
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_params
      params.require(:order_item).permit(:product_id, :quantity, :order_id)
    end
end
