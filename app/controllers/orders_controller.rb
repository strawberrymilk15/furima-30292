class OrdersController < ApplicationController
 before_action :itemer
 before_action :authenticate_user!, only: [:index,:create]
 before_action :log_user_show

  def index
    @purchase = PurchaseForm.new
  end

  def create
   @purchase = PurchaseForm.new(set_params)
   if @purchase.valid?
    pay_item
    @purchase.save
    return redirect_to root_path
   else
    render 'index'
   end
  end

  private

  def set_params
    params.require(:purchase_form).permit(:address_number,:prefecture_id,:municipalities,:address,:building_name,:phone_number).merge(token: params[:token],user_id: current_user.id,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end

  def itemer
    @item =Item.find(params[:item_id])
  end

  def log_user_show
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
  end




end