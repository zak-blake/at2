class MessagesController < ApplicationController
  before_action :find_message, only: [:show, :destroy]
  before_action :check_user, only: :index

  def new
    @user = User.find_by_id(params[:artist_id])
    @message = Message.new
  end

  def create
    @message = Message.new(permit_message)

    # assign the based on the page we came from
    @message.receiver_id = params[:a_id]

    #pass data to the mailer
    @user = User.find_by_id(@message.receiver_id)

    if @message.save
      ArtistMailer.inquire_email(@message)
      redirect_to root_path
    else
      puts "Fail create message"
      render 'new'
    end
  end

  def index
    @message_display_count = 0
    @admin_mode = user_signed_in? && current_user.admin?
    if @admin_mode
      # Artist Hash
      @aht = {}
      User.find_each do |u|
        @aht[u.id] = u.full_name
      end
    end

    def destroy
      @message.destroy
      redirect_to messages_path
    end

  end

  private
    def permit_message
      params.require(:message).permit(:title, :body, :sender_email, :receiver_id)
    end

    def find_message
      @message = Message.find(params[:id])
    end

    def check_user
      unless user_signed_in?
        redirect_to root_path
      end
    end
end
