class Company < ApplicationRecord
  has_many :subscriptions, dependent: :destroy

  has_one_attached :image
end
