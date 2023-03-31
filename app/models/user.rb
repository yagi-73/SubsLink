class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subscriptions
  has_many :subscribes
  has_many :admin_subscriptions, through: :subscribes

  def subscriptions
    self.user_subscriptions + self.admin_subscriptions
  end
  
  def subscribe(subsc_id)
    subscribes.create(admin_subscription_id: subsc_id)
  end

  def unsubscribe(subsc)
    if subsc.class == UserSubscription
      subsc.destroy
    else
      subscribing(subsc).destroy
    end
  end

  def subscribing(subsc)
    subscribes.find_by(admin_subscription_id: subsc.id)
  end
end
