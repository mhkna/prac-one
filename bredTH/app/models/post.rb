class Post < ApplicationRecord
  # dependent: :destroy deletes commments from db when post is deleted
  has_many :comments, dependent: :destroy
  validates :text, presence: true,
                   length: { minimum: 2 }
  validates :latitude, :longitude, presence: true

  geocoded_by :ip_address
  before_validation :geocode

  def ip_address
    # if @ip == "127.0.0.1"
    "2620:0:2250:101c:1cfd:8a4f:162a:48eb"
    # else
    #   @ip
    # end
  end

  def near_and_recent
    
  end

end
