class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:create]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end
    end

    def edit
      @item = Item.find(params[:id])
      unless user_signed_in? && current_user.id == @item.user_id
        redirect_to root_path
      end
    end

  private

  def item_params
  params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id, :selling_price, :image
  ).merge(user_id: current_user.id)
  end
end
