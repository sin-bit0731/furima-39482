class ItemsController < ApplicationController
  def index
    @items = Item.all
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
    params.require(:item).permit(:description, :category_id, :condition_id, :ship_area_id, :ship_charge_id, :ship_day_id, :ship_method_id, :item_image).merge(user_id: current_user.id)
  end  
end
