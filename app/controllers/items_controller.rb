class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    set_item_dependencies
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      set_item_dependencies
      render :new, status: :unprocessable_entity
    end
  end

    private
    def item_params
      params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price ).merge(user_id:current_user.id)
    end

    def set_item_dependencies
      @categories = Category.all
      @conditions = Condition.all
      @prefectures = Prefecture.all
      @delivery_charges = DeliveryCharge.all
      @delivery_days = DeliveryDay.all
    end
end
