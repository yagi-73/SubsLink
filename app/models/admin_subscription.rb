class AdminSubscription < Subscription
  belongs_to :user, optional: true
  belongs_to :company
end
