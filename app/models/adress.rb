class Adress < ApplicationRecord
  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?

  belongs_to :farm
  has_many :opening_times
  def coordinates
    [longitude, latitude]
  end
end
