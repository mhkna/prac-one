class Post < ApplicationRecord
  # dependent: :destroy deletes commments from db when post is deleted
  has_many :comments, dependent: :destroy
  validates :text, presence: true,
                   length: { minimum: 5 }
end
