class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  attribute :views, :integer, default: 0


  #chat code below
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "id", "name", "updated_at", "views"]
  end

end
