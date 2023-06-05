class RecommendedUser < ApplicationRecord
  belongs_to :subject_user
  belongs_to :recommended_user
end
