class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
