class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
    @conditions = Condition.all
    @prefectures = Prefecture.all
    @delivery_charges = Delivery_charge.all
    @delivery_days = Delivery_day.all
  end

end
