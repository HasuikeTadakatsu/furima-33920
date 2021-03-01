class ChatsController < ApplicationController

  def index
    @chats = Chat.all.order("created_at DESC")
  end

  def create
    Chat.create(chat: params[:chat])
  end

end
