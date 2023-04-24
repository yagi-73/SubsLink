class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subscriptions
  has_many :subscribes
  has_many :admin_subscriptions, through: :subscribes

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  has_one_attached :image

  def subscriptions
    self.user_subscriptions + self.admin_subscriptions
  end

  def subscribe(params)
    subscribes.create!(params)
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

  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
