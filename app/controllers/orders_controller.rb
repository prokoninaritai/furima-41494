class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_shipping_address = OrderShippingAddress.new
    return unless @item.user_id == current_user.id || @item.order.present?

    redirect_to '/'
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      redirect_to '/'
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipping_address).permit(:post_code, :prefecture_id, :city, :address, :building, :mobile).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @order_shipping_address.token,
      currency: 'jpy'
    )
  end
end
