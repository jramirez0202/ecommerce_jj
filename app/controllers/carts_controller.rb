class CartsController < ApplicationController
  before_action :authenticate_user!
  require 'sendgrid-ruby'
  include SendGrid
  require 'json'

    def update
      product_id = params[:cart][:product_id]
      quantity = params[:cart][:quantity]
  
      current_order.add_product(product_id, quantity)
  
      redirect_to root_path, notice: "Product add to cart"
    end
  
    def show
      @products = Product.all
      @order = current_order
      @order_items = @order.order_items
    end

  
    def destroy
      @order = current_order
      @order_item = @order.order_items.find(params[:id])
      @order_item.destroy
      @order_items = current_order.order_items
      redirect_to carts_path
    end

    def pay_with_paypal
    order = current_order
    price = order.total * 10

    response = EXPRESS_GATEWAY.setup_purchase(price,
      ip: request.remote_ip,
      return_url: process_paypal_payment_cart_url,
      cancel_return_url: root_url,
      allow_guest_checkout: true,
      currency: "USD"
    )

    payment_method = PaymentMethod.find_by(code: "PEC")
    Payment.create(
      order_id: order.id,
      payment_method_id: payment_method.id,
      state: "processing",
      total: order.total,
      token: response.token
    )

    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end



    def process_paypal_payment
      details = EXPRESS_GATEWAY.details_for(params[:token])
      express_purchase_options =
        {
          ip: request.remote_ip,
          token: params[:token],
          payer_id: details.payer_id,
          currency: "USD"
        }

      price = details.params["order_total"].to_d * 100

      response = EXPRESS_GATEWAY.purchase(price, express_purchase_options)
      if response.success?
        payment = Payment.find_by(token: response.token)
        order = payment.order

        #update object states
        payment.state = "completed"
        order.state = "completed"

        ActiveRecord::Base.transaction do
          order.save!
          payment.save!
        end
        redirect_to root_path, notice: 'Compra exitosa'
        
        from = Email.new(email: 'johkcolom@gmail.com')
        subject = 'Hello World from the Twilio SendGrid Ruby Library'
        to = Email.new(email: 'johkcolom@gmail.com')
        content = Content.new(type: 'text/plain', value: 'some text here')
        mail = SendGrid::Mail.new(from, subject, to, content)
        # puts JSON.pretty_generate(mail.to_json)
        puts mail.to_json
      
        
        sg = SendGrid::API.new(api_key: ENV['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'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        
      else
        redirect_to root_path, alert: 'Problemas con tu compra'
      end

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:name, :photo, users_attributes: [:id,:user_id, :role])
    end
end