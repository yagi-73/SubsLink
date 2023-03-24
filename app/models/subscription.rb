class Subscription < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  def next_update_day
    start_time.since(self.update_cycle.month)
  end
end
