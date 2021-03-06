class Sneaker < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :brand
  validates :brand_id, :image, presence: true
end
