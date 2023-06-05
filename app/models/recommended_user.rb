class RecommendedUser < ApplicationRecord
  belongs_to :subject_user, class_name: "User"
  belongs_to :recommended_user, class_name: "User"
end
