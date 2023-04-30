class Subscribe < ApplicationRecord
  belongs_to :admin_subscription
  belongs_to :user

  validates :contract_day, presence: true
end
