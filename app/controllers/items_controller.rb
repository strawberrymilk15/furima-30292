class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    (item_params)
  end

  private
  def item_params
    params.require(:item).permit(:prefecture)
  end

end

