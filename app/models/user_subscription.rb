class UserSubscription < Subscription
  belongs_to :user
  validates :contract_day, presence: true
end