class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body


  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  # def notify_recipient
  #   CommentNotificationNotifier.with(comment: self, post: post).deliver_later(post.user)
  #   # CommentNotificationNotifier.with(record: self.post, message: "New comment").deliver_later(self.post.user)
  #   # CommentNotificationNotifier.with(record: self.post, message: "New comment").deliver(User.all)
  # end

  def notify_recipient
    CommentNotificationNotifier.with(comment_id: self.id, post_id: self.post_id).deliver_later(self.post.user)
  end


  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
