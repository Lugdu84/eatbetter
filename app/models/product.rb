class Product < ApplicationRecord
  belongs_to :farm
  has_many :order_items
  has_many_attached :photos
  validates :name, presence: true
  validates :price, presence: true
  validates :units, presence: true
end
