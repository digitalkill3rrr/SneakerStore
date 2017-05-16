class Brand < ApplicationRecord
  mount_uploader :logos, LogosUploader
  has_many :sneakers
  validates :name, :logos, presence: true
end
