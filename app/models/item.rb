class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
  validates :name
  validates :description
  validates :image
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id
  end

  with_options format: { with: /\A[0-9]+\z/ } do
  validates :selling_price, numericality: { greater_than: 299, less_than: 10000000 } 
  end
end
