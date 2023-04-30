class Company < ApplicationRecord
  has_many :admin_subscriptions, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
end
