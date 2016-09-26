class PiecesController < ApplicationController
  before_action :find_piece, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(permit_piece)

    if params[:p_id]
      @piece.album_id = params[:p_id]
    end

    if @piece.save
      flash[:success] = "Piece Created"
      redirect_to piece_path(@piece.id)
    else
      flash[:error] = "Create Failed"
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
      flash[:success] = "Update Successful"
      redirect_to piece_path(@piece.id)
    else
      flash[:error] = "Update Failed"
      render 'edit'
    end
  end

  def destroy
    aid = @piece.album_id
    @piece.destroy
    flash[:success] = "Piece Deleted"
    redirect_to album_path(aid)
  end

  private
    def permit_piece
      params.require(:piece).permit(:title, :description, :image, :album_id, :priority, :sold)
    end

    def find_piece
      @piece = Piece.find(params[:id])
    end

end
