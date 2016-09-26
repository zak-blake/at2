class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :destroy]

  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(permit_album)
    if @album.save
      flash[:success] = "Album Created"
      redirect_to album_path(@album.id)
    else
      flash[:error] = "Creation Failed"
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(@album.user_id)
    @edit_mode = user_signed_in? && current_user.id == @album.user_id
    @admin_mode = user_signed_in? && current_user.admin?
  end

  def edit
  end

  def update
    if @album.update(permit_album)
      flash[:success] = "Update Successful"
      redirect_to album_path(@album.id)
    else
      flash[:error] = "Update Failed"
      render 'edit'
    end
  end

  def destroy
    uid = @album.user_id
    @album.destroy
    flash[:success] = "Album Deleted"
    redirect_to user_path(uid)
  end

  private
    def permit_album
      params.require(:album).permit(:title, :description, :image, :priority)
    end

    def find_album
      @album = Album.find(params[:id])
    end

end
