class Post < ApplicationRecord
    validates :description, presence: true,
    length: { minimum: 5 }
    belongs_to :user
    has_many :comments
    has_many :likes
    has_many :profiles
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize_to_limit: [150, 150]
    end
end
