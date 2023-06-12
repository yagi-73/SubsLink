class User < ApplicationRecord
  include IdGenerator
  include TagGenerator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_subscriptions, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  has_many :admin_subscriptions, through: :subscribes

  has_many :recommend_relationships, class_name: "RecommendedUser", foreign_key: "subject_user_id", dependent: :destroy
  has_many :recommended_users, through: :recommend_relationships, source: :recommended_user

  has_many :recommend_reverse_of_relationships, class_name: "RecommendedUser", foreign_key: "recommended_user_id", dependent: :destroy
  has_many :subject_users, through: :recommend_reverse_of_relationships, source: :subject_user

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :image

  validates :name, length: { in: 2..5 }
  validates :introduction, length: { maximum: 100 }

  scope :top_subscribers, -> { order(subscribes_count: :desc).limit(5).with_attached_image }

  def subscriptions
    self.user_subscriptions.with_attached_image + self.admin_subscriptions.with_attached_image
  end

  def unsubscribe(subsc)
    subscribes.find_by(admin_subscription_id: subsc.id).destroy
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

  def related_users
    return followings if !followings.empty?
    followers.empty? ? self.class.all : followers
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

end
