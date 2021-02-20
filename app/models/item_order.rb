class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
  validates :token 
  validates :postal_code
  validates :prefecture_id
  validates :municipality
  validates :address
  validates :building_name
  validates :phone_number
  end

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ } do
  validates :postal_code, length: { is: 8 } 
  end

  with_options presence: true, numericality: { other_than: 1 } do
  validates :prefecture_id
  end

  with_options presence: true, format: { with: /\A\d{11}\z/ } do
  validates :phone_number
  end



end