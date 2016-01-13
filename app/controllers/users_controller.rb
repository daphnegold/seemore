class UsersController < ApplicationController
  before_action :require_login
  before_action :correct_user, only: :show

  def show
    @user = User.find(params[:id])
    @vimeo_handles = @user.find_vimeo_handles
    @twitter_handles = @user.find_twitter_handles
  end

  def deauthorize
    user = User.find(params[:id])
    identities = user.identities
    identities.each do |identity|
      if identity.provider == params[:provider]
        Identity.delete(identity)
      end
    end
    redirect_to user_path(user.id)
  end
end
