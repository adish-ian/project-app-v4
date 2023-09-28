class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 5, maximum: 500}
    validates :keywords, presence: true, length: {minimum: 5, maximum: 100}

    has_many_attached :images
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy

    has_many :likes
end
