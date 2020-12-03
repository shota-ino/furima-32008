class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
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

  # def destroy
  #   if current_user.id == @item.user_id
  #     @item.destroy
  #     redirect_to root_path
  #   else
  #     render :show
  #   end
  # end

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item)
          .permit(:name, :introduction, :category_id, :item_condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end
end
