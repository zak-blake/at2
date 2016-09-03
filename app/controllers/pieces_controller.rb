class PiecesController < ApplicationController
  before_action :find_piece, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(permit_piece)
    if @piece.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @piece_owner = User.find_by_id(Album.find_by_id(@piece.album_id).user_id)
    @piece_album = Album.find_by_id(@piece.album_id)
    @edit_mode = user_signed_in? && current_user.id == @piece_owner.id
  end

  def edit
  end

  def update
    if @piece.update(permit_piece)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @piece.destroy
    redirect_to root_path
  end

  private
    def permit_piece
      params.require(:piece).permit(:title, :description, :image, :album_id, :priority)
    end

    def find_piece
      @piece = Piece.find(params[:id])
    end

end
