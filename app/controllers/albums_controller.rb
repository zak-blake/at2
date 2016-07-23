class AlbumsController < ApplicationController
  before_action :find_album, only: [:show, :edit, :update, :destroy]

  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(permit_album)
    if @album.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @album.update(permit_album)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @album.destroy
    redirect_to root_path
  end

  private
    def permit_album
      params.require(:album).permit(:title, :description, :image)
    end

    def find_album
      @album = Album.find(params[:id])
    end

end
