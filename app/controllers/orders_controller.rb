class OrdersController < ApplicationController

  def index
    @order_shippint_address = OrderShippingAddress.new
  end

  def create
  end
end
