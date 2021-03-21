class Farm < ApplicationRecord
  CATEGORIES = %w[légumes fruits fleurs fromages poissons viandes]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :products
  has_many :reviews
  has_many :adresses
  has_many_attached :photos

  acts_as_taggable_on :tags, :type_farm

  def coordinates
    [longitude, latitude]
  end
end
