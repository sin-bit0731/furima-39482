class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :ship_area_id, :ship_charge_id,
                                 :ship_day_id, :image, :price).merge(user_id: current_user.id)
  end
end
