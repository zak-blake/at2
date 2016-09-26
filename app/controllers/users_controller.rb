class UsersController < ApplicationController

  before_action :authorize_admin, only: [:create, :new]

  def show
    @user = User.find(params[:id])
    @edit_mode = user_signed_in? && (current_user.id == @user.id)
    @user_albums = Album.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permit_user)
    if(@user.save)
      redirect_to user_path(@user.id)
    else
      puts @user.errors.full_messages
      render 'new'
    end
    #admin only
  end

  private
    def authorize_admin
      return unless !current_user.admin?
      flash[:error] = "Admin Only"
      redirect_to root_path
    end

    def permit_user
      params.require(:user).permit(:email, :password, :full_name, :bio, :avatar)
    end

end
