class Category < ApplicationRecord
  has_many :admin_subscriptions, dependent: :destroy

  validates :name, length: { in: 2..10 }
  validates :icon, length: { in: 2..20 }
end
