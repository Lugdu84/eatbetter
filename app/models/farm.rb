class Farm < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  belongs_to :category
  has_many :products
  has_many_attached :photos

  def coordinates
    [longitude, latitude]
  end
end
