class Subscription < ApplicationRecord
  has_one_attached :image

  def next_update_day
    contract_day.since(self.update_cycle.month)
  end
end
