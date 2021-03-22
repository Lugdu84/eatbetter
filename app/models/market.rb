class Market < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :farm
  has_many :openings
  has_many :order_items

  def coordinates
    [longitude, latitude]
  end
end
