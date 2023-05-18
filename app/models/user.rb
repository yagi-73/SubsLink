class User < ApplicationRecord
  before_create :generate_tag

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subscriptions
  has_many :subscribes
  has_many :admin_subscriptions, through: :subscribes

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  belongs_to :favorite_subscription, class_name: "Subscription"

  has_one_attached :image

  validates :name, length: { in: 2..10 }

  def subscriptions
    self.user_subscriptions.with_attached_image + self.admin_subscriptions.with_attached_image
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

  private

  def generate_tag
    self.tag = loop do
      tag = rand(1000..9999)
      break tag unless self.class.exists?(tag: tag)
    end
  end
end
