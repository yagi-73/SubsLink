class AdminSubscriptionsUser < ApplicationRecord
  belongs_to :user
  belongs_to :admin_subscription
end
