require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の登録' do
    before do
      @order_destination = FactoryBot.build(:order_destination)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_destination).to be_valid
    end
    it '郵便番号が空だと登録できない' do
      @order_destination.post_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Post code can't be blank", 'Post code Input correctly')
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_destination.post_code = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Post code Input correctly')
    end
    it 'prefecture_code_idを選択していないと保存できないこと' do
      @order_destination.prefecture_code_id = 1
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Prefecture code Select')
    end
    it 'cityが空だと登録できない' do
      @order_destination.city = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと登録できない' do
      @order_destination.house_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも登録できる' do
      @order_destination.building_name = ''
      expect(@order_destination).to be_valid
    end
    it 'phone_numberが空だと登録できない' do
      @order_destination.phone_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank", 'Phone number Input only number')
    end
    it 'phone_numberが11桁以上だと登録できない' do
      @order_destination.phone_number = '123456789012'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number Input only number')
    end
    it 'phone_numberに-が含まれていると登録できない' do
      @order_destination.phone_number = '123-3456-7890'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number Input only number')
    end
    it 'tokenが空だと登録できない' do
      @order_destination.token = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Token can't be blank")
    end
  end
end
