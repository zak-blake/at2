class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :destroy]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(permit_message)

    #this should always trip
    puts "!!!!!"
    if params[:a_id]
      puts "CONTROLLER RECV A_ID"
      @message.receiver_id = params[:a_id]
    end

    if @message.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @artist_mode = user_signed_in?
    @admin_mode = @artist_mode && current_user.admin?
  end

  private
    def permit_message
      params.require(:message).permit(:title, :body, :sender_email, :receiver_id)
    end

    def find_message
      @message = Message.find(params[:id])
    end
end
