class AdminSubscription < Subscription
  belongs_to :company
  belongs_to :category
  has_many :subscribes
  has_many :users, through: :subscribes

  has_many :extension_subscriptions, class_name: 'Subscription', foreign_key: 'basic_subscription_id'
  belongs_to :basic_subscription, class_name: 'Subscription', optional: true

  validates :catch_copy, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  scope :top_subscribes,  -> { sort_by {|subsc| -subsc.subscribes_count }.take(3) }
end
