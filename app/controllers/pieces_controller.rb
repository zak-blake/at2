class PiecesController < ApplicationController
  before_action :find_piece, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @piece = current_user.pieces.build
  end

  def create
    @piece = current_user.pieces.build(permit_piece)
    if @piece.save
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
      params.require(:piece).permit(:title, :description, :image)
    end

    def find_piece
      @piece = Piece.find(params[:id])
    end

end
