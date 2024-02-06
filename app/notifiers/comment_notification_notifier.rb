# To deliver this notification:
#
# CommentNotification.with(record: @post, message: "New post").deliver(User.all)

class CommentNotificationNotifier < ApplicationNotifier
  # Add your delivery methods


 deliver_by :database # Even though it's automatically included, it's fine to be explicit in tutorials

  param :comment_id, :post_id

  def message
    comment = Comment.find(params[:comment_id])
    post = Post.find(params[:post_id])
    user = User.find(comment.user_id)
    "#{user.email} commented on #{post.title.truncate(10)}"
  end

  def url
    post_path(params[:post_id])
  end





  #this below doesnt crash but wont load database
  # def message
  #   @post = Post.find(params[:comment][:post_id])
  #   @comment = Comment.find(params[:comment][:id])
  #   @user = User.find(@comment.user_id)
  #   "#{@user.email} commented on #{@post.title.truncate(10)}"
  # end

  # def url
  #   post_path(Post.find(params[:comment][:post_id]))
  # end

  #this above doesnt crash but wont load database


  # 'deliver_by :database' is deprecated and automatically included

  # required_param :record, :message

  # Define how to store the notification in the database
  # def to_database
  #   {
  #     type: self.class.name,      # Optionally store the type of notification
  #     params: params.deep_stringify_keys.to_json      # Ensure keys are strings before serialization
  #   }
  # end
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message
end
