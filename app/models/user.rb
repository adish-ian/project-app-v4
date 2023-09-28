class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  has_one_attached :avatar
  has_many :likes
  
  followability
  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
  def self.ransackable_attributes(auth_object = nil)
    %w[bio created_at email id name remember_created_at updated_at]
  end

  

end
