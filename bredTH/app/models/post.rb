class Post < ApplicationRecord
  validates :text, presence: true,
                   length: { minimum: 5 }
end
