class ChatsController < ApplicationController

  def index
    @chats = Chat.all.order("created_at DESC")
  end

  def create
    chat = Chat.create(chat: params[:chat])
    render json:{ chat: chat }
  end

end
