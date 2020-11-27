class Item < ApplicationRecord

  # has_one_attached :image
  
  # validates :, presence: true
  # validates :, presence: true
  # validates :, presence: true
  # validates :, presence: true

  belongs_to :user
  # has_one    :order
end
