class User < ApplicationRecord
  include IdGenerator
  include TagGenerator

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

  validates :name, length: { in: 2..10 }
  validates :introduction, length: { maximum: 100 }

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
      subscribes.find_by(admin_subscription_id: subsc.id).destroy
    end
  end

  def subscribe_day(subsc)
    subscribes.find_by(admin_subscription_id: subsc.id).contract_day
  end

  def subscribing?(subsc)
    admin_subscriptions.include?(subsc)
  end

  def not_subscribing
    AdminSubscription.where.not(id: self.admin_subscriptions.pluck(:id))
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

  def mutually_followings
    followings.with_attached_image & followers.with_attached_image
  end

end
