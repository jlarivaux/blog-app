class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :body, presence: true, length: {minimum: 10, maximum: 1000}
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy



  #chat code below
  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "title", "updated_at", "user_id", "views"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comments", "user"]
  end
end
