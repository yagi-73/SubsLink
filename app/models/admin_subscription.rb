class AdminSubscription < Subscription
  belongs_to :company
  belongs_to :category
  has_many :subscribes
  has_many :users, through: :subscribes

  belongs_to :basic_subscription, class_name: 'AdminSubscription', optional: true
  has_many :extension_subscriptions, class_name: 'Subscription', foreign_key: 'basic_subscription_id'

  validates :catch_copy, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  scope :top_subscribes,  -> { sort_by {|subsc| -subsc.subscribes_count }.take(3) }
  scope :no_overlap,      -> { uniq{ |n| n.group_id } }
  scope :same_group,      -> (subsc){ where(group_id: subsc.group_id).where.not(id: subsc.id) }
end
