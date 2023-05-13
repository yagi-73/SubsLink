class AdminSubscription < Subscription
  belongs_to :company
  belongs_to :group
  has_many :subscribes
  has_many :users, through: :subscribes

  validates :description, length: { maximum: 500 }

  scope :top_subscribes,  -> { sort_by {|subsc| -subsc.subscribes.size }.take(3) }
  scope :no_overlap,      -> { uniq{ |n| n.group_id } }
  scope :same_group,      -> (subsc){ where(group_id: subsc.group_id).where.not(id: subsc.id) }
  scope :search,          -> (keyword){ where(["name LIKE?", "%#{keyword}%"]) }
end
