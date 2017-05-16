class Brand < ApplicationRecord
  mount_uploader :logos, LogosUploader
  has_many :sneakers
  validates :logos, presence: true
end
