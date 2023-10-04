class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]

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
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else  
      render :edit, status: :unprocessable_entity
    end  
  end  

  private

  def set_item
    @item = Item.find(params[:id])
  end  

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :ship_area_id, :ship_charge_id,
                                 :ship_day_id, :image, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user == current_user
      redirect_to root_path
    end
  end    
end
