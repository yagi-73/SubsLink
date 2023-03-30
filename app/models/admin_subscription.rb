class AdminSubscription < Subscription
  belongs_to :company
  belongs_to :group
  has_many :admin_subscriptions_users

  scope :no_overlap, -> { uniq{ |n| n.group_id } }
  scope :same_group, -> (subsc){ where(group_id: subsc.group_id).where.not(id: subsc.id) }
end
