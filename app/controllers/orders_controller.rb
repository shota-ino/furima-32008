class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render 'index'
      @order_destination = OrderDestination.new
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_destination).permit(
      :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(
        token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

end
