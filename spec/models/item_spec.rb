require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品の保存ができる場合' do
      it 'すべての情報が正しく記述してあれば保存ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it '商品画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がないと保存できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーがないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態がないと保存できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it '配送料の負担がないと保存できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end

      it '発送元の地域がないと保存できない' do
        @item.prefecture_code_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture code can't be blank")
      end

      it '発送までの日数がないと保存できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank")
      end

      it '価格がないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が¥300未満では保存できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Please enter between 300 and 9,999,999 half-width numbers.")
      end

      it '価格の範囲が¥9,999,999より大きいと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Please enter between 300 and 9,999,999 half-width numbers.")
      end

      it '価格は半角英数でないと保存できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Please enter between 300 and 9,999,999 half-width numbers.")
      end

      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end