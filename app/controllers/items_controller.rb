class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      # 成功した場合はredirect_toメソッドでルートパスにリダイレクト
      redirect_to root_path
    else
      # 失敗した場合はrenderメソッドでprototypes/new.html.erbのページを表示
      render :new
    end
  end

end
