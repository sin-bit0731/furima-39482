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
      redirect_to root_path(id: current_user)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(id: current_user)
    else  
      render :edit, status: :unprocessable_entity
    end  
  end  

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :ship_area_id, :ship_charge_id,
                                 :ship_day_id, :image, :price).merge(user_id: current_user.id)
  end
end
