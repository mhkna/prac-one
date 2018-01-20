class Post < ApplicationRecord
  # dependent: :destroy deletes commments from db when post is deleted
  has_many :comments, dependent: :destroy
  validates :text, presence: true,
                   length: { minimum: 5 }
  # geocoded_by :ip_address, :latitude  => :lat, :longitude => :lon
  #after_validation :geocode#, if: ->(obj){ obj.address.present? and obj.address_changed? }

  # def ip_address
  #   request.remote_ip
  # end
end
