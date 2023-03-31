class Subscribe < ApplicationRecord
  belongs_to :admin_subscription
  belongs_to :user
end
