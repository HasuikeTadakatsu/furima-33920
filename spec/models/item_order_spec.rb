require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @item_order = FactoryBot.build(:item_order, user_id: @user.id , item_id: @item.id)
      sleep(1)
    end

     context '購入ができる時' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item_order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @item_order.building_name = ""
        expect(@item_order).to be_valid
      end
     end

      context '購入ができない時'do
       it 'token(クレジットカード情報)が空だと購入ができない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include()
      end
      it 'postal_codeが空だと購入ができない' do
        @item_order.postal_code = ""
        @item_order.valid?
        expect(@item_order.errors.messages).to include({:postal_code => ["can't be blank", "can't be blank", "is invalid"]})
      end
      it 'postal_codeにハイフンがないと登録できない' do
        @item_order.postal_code = "12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが8桁でないと購入できない' do
        @item_order.postal_code = "123-458"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと購入できない' do
        @item_order.municipality = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと購入できない' do
        @item_order.address = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが11桁でなければ購入できない' do
        @item_order.phone_number = "080123456789"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英数字混合でなければ購入できない' do
        @item_order.phone_number = "aaa12345678"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空だと購入できない' do
        @item_order.user_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @item_order.item_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end