class Public::RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    reset_recommended_users
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    reset_recommended_users
    redirect_to request.referer
  end

  private

  def reset_recommended_users
    current_user.recommended_users.destroy_all
    3.times do
      recommended_user = get_recommended_user
      if recommended_user.present? && !current_user.recommended_users.include?(recommended_user)
        RecommendedUser.create!(subject_user_id: current_user.id, recommended_user_id: recommended_user.id)
      end
    end
  end

  def get_recommended_user
    random_related_user = current_user.related_users.offset( rand(current_user.related_users.length) ).take
    recommended_user = random_related_user.related_users.offset( rand(random_related_user.related_users.length) ).take
    if recommended_user == current_user || current_user.following?(recommended_user)
      nil
    else
      recommended_user
    end
  end
end
