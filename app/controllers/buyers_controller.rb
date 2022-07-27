class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only:[:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
    @buyer_shopping = BuyerShopping.new
  end

  def create

    @buyer_shopping = BuyerShopping.new(buyer_params)
    if @buyer_shopping.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: params[:token],   
        currency: 'jpy'             
      )
      @buyer_shopping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_shopping).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number,:price).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end