class Notification < ApplicationRecord
  has_noticed_notifications model_name: 'Notification'
  belongs_to :post
end
