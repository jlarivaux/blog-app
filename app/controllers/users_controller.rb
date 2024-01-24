class UsersController < ApplicationController
  before_action :set_user
  def profile
    # change_column :users, :views, :integer, default: 0
    @user.update(views: (@user.views ||0) + 1)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
