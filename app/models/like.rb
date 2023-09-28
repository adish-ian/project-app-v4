class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: {scope: :post_id}
  after_create_commit :notify_reciepient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private
  def notify_reciepient
    LikeNotification.with(like: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
    notifications_as_like.destroy_all
  end
end
