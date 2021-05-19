class OrderItemsController < ApplicationController
require 'sendgrid-ruby'
include SendGrid

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
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
    # @product.destroy
    @order_item.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # def destroy
  #   @order = current_order
  #   @order_item = @order.order_items.find(params[:id])
  #   @order_item.destroy
  #   @order_items = current_order.order_items
  #   redirect_to carts_path
  # end

  private

  def set_category
    @order_item = OrderItem.find(params[:id])
  end

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
