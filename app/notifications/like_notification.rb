# To deliver this notification:
#
# LikeNotification.with(post: @post).deliver_later(current_user)
# LikeNotification.with(post: @post).deliver(current_user)

class LikeNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @post = Post.find(params[:like][:post_id])
    @like = Like.find(params[:like][:id])
    @user = User.find(@like.user_id)
    "#{@user.email} likes your post #{@post.title.truncate(10)}"
  end
  
  def url
    post_path(Post.find(params[:like][:post_id]))
  end
end
