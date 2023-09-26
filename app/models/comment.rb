class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_reciepient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_reciepient
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
