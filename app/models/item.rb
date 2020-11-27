class Item < ApplicationRecord
  
  # validates :, presence: true
  # validates :, presence: true
  # validates :, presence: true
  # validates :, presence: true
  validates :image, presence: true

  belongs_to :user
  # has_one    :order
  has_one_attached :image
end
