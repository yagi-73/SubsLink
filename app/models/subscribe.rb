class Subscribe < ApplicationRecord
  belongs_to :admin_subscription, counter_cache: true
  belongs_to :user

  validates :contract_day, presence: true
end
