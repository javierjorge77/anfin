class OrdersController < ApplicationController

  def create
  suscription = Suscription.find(params[:suscription_id])
  order = Order.create!(suscription: suscription, suscription_sku: suscription.sku, price_cents: suscription.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      price_data: {
        currency: 'usd',
        unit_amount: suscription.price_cents,
        product_data: {
          name: suscription.sku,
        },
      },
      quantity: 1,
    }],
    mode: 'payment',
    success_url: order_url(order),
    cancel_url: order_url(order)

  )
  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)

  authorize suscription
  authorize order


  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end


end
