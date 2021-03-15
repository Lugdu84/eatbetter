class Category < ApplicationRecord
  has_many :farms
  validates :name, presence: true
end
