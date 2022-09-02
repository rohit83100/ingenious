class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
  end
end
