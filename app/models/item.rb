class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one    :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :preparation_day

  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price, inclusion: { in: 300..9_999_999, message: 'is invalid. Please enter between 300 and 9,999,999 half-width numbers.' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_condition_id
    validates :postage_payer_id
    validates :prefecture_code_id
    validates :preparation_day_id
  end
end
