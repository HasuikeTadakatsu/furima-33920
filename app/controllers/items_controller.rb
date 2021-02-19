class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user_singed_in, only: [:edit, :updete, :destroy]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def show
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user_singed_in
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def item_params
     params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id, :selling_price, :image
   ).merge(user_id: current_user.id)
  end
end
