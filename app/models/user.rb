class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, ->(user) { where.not(id: user)}
  after_create_commit { broadcast_append_to "user" }
  has_many :posts 
  has_many :comments
  has_many :likes   
  has_one :profile
  has_many :messages 
  acts_as_voter 
end
