class RelationshipsController < ApplicationController
    before_action :set_user

  def create
    # @user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(@user)
    following.save
      # flash[:success] = "ユーザーをフォローしました"
      redirect_to request.referer
    # else
      # flash.now[:alert] = "ユーザーのフォローに失敗しました"
      # redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
      # flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to request.referer
    # else
      # flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      # redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
