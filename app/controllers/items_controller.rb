class ItemsController < ApplicationController
  before_action :set_item, only: [:log_user_edit,:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :log_user_edit, only: [:edit,:update]
  
  def index
    @items = Item.order("created_at DESC").includes(:user)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
     else
      render :edit
     end
    end


  def destroy
    if current_user.id == @item.user_id
      @item.destroy
     redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:price,:description_of_item,:prefecture_id,:product_condition_id,:date_of_shipment_id,:shipping_charge_id,:category_id,images: []).merge(user_id: current_user.id)
  end

  def set_item 
    @item = Item.find(params[:id])
  end


  def log_user_edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end