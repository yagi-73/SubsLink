class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subscriptions
  has_many :admin_subscriptions_users
  has_many :admin_subscriptions, through: :admin_subscriptions_users

  def subscriptions
    self.user_subscriptions + self.admin_subscriptions
  end
  
end
