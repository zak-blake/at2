class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @edit_mode = user_signed_in? && (current_user.id == @user.id)
  end

end
