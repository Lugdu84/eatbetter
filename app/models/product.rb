class Product < ApplicationRecord
  belongs_to :farm
  validates :name, presence: true
  validates :price, presence: true
  validates :units, presence: true
end
