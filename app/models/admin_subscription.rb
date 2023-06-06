class AdminSubscription < Subscription
  belongs_to :company
  belongs_to :category
  has_many :subscribes
  has_many :users, through: :subscribes

  has_many :extension_subscriptions, class_name: 'Subscription', foreign_key: 'basic_subscription_id'
  belongs_to :basic_subscription, class_name: 'Subscription', optional: true

  validates :catch_copy, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  scope :top_subscribes,  -> { order(subscribes_count: :desc).limit(3) }
  scope :related_subscriptions, -> (current_subsc){ where(id: current_subsc.basic_subscription_id).or(where(basic_subscription_id: current_subsc.basic_subscription_id).where.not(id: current_subsc.id)) }
  scope :same_company_basic_subscriptions, -> (subsc){ where(company_id: subsc.company_id, is_basic: true).where.not(id: subsc.id) }
end
