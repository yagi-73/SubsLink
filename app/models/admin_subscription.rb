class AdminSubscription < Subscription
  belongs_to :company
  has_many :admin_subscriptions_users
end
