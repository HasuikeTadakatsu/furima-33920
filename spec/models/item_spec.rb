require 'rails_helper'

describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@item).to be_valid
      end
    
    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録されない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録されない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

        it 'category_idが空では登録されない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

        it 'status_idが空では登録されない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

        it 'shipping_fee_burden_idが空では登録されない' do
        @item.shipping_fee_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden is not a number")
      end

      it 'prefecture_idが空では登録されない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it 'days_to_ship_idが空では登録されない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship is not a number")
      end

      it 'それぞれのidで1が選択された場合は登録されない' do
        @item.category_id = '1'
        @item.status_id = '1'
        @item.shipping_fee_burden_id = '1' 
        @item.prefecture_id = '1'
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1", "Status must be other than 1", "Shipping fee burden must be other than 1", "Prefecture must be other than 1", "Days to ship must be other than 1")
      end

      it 'selling_priceが空では登録されない' do
        @item.selling_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is invalid", "Selling price is not a number")
      end

      it 'selling_priceが半角数字以外では登録できない' do
        @item.selling_price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end

      it 'selling_priceが300より少ないと登録できない' do
        @item.selling_price = "50"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than 299")
      end

      it 'priceが9999999より多いと登録できない' do
        @item.selling_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 10000000")
      end

     end
    end
  end
end
