class Subscription < ApplicationRecord
  has_one_attached :image
  attr_accessor :calender_day

  validates :name, length: { in: 2..30 }
  validates :price, presence: true
  validates :update_cycle, numericality: { in: 1..12 }

  def next_update_day
    contract_day.since(self.update_cycle.month)
  end

  def update_this_month?(date)
    next_update_month = self.contract_day.month - 12
    while next_update_month < date.month
      next_update_month += self.update_cycle
    end
    self.contract_day.strftime('%Y-%m') <= date.strftime('%Y-%m') && next_update_month == date.month
  end
end
