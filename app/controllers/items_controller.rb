class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
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

  #def show
  #end

  #def edit
  #end

  #def update
   # if @item.update(item_params)
    #  redirect_to item_path(@item)
    #else
   #render :edit
    #end
  #end

  #def destroy
    #if @item.destroy
      #redirect_to root_path
    #else
     # redirect_to root_path
   # end
  #end

  private
  def item_params
    params.require(:item).permit(:name,:price,:description_of_item,:prefecture_id,:product_condition_id,:date_of_shipment_id,:shipping_charge_id,:category_id,:image).merge(user_id: current_user.id)
  end

end

