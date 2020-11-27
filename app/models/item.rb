class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :preparation_day

  validates :name, :text, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  validates :prefecture_code_id, numericality: { other_than: 1 }
  validates :preparation_day_id, numericality: { other_than: 1 }
  validates :price, presence: true
  # validates :, presence: true
  # validates :, presence: true
  validates :image, presence: true

  belongs_to :user
  # has_one    :order
  has_one_attached :image


end
