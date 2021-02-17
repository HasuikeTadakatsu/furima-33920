require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthday_dateが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      
      it "passwordが6文字以上であれば登録できる" do
      @user.password = "abc456"
      @user.password_confirmation = "abc456"
      expect(@user).to be_valid
      end

      context '新規登録できないとき' do
      
      it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "emailは、@を含まないと登録できない" do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
      @user.password = "abc45"
      @user.password_confirmation = "abc45"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英字のみでは登録できない" do
      @user.password = "aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが数字のみでは登録できない" do
      @user.password = "1111111"
      @user.password_confirmation = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが全角英数字では登録できない" do
      @user.password = "ａｂｃ１２３４"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "abc456"
      @user.password_confirmation = "abc4567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameか半角英字だと登録できない" do
      @user.last_name = "abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input Kanji characters.")
      end

      it "first_nameか半角英字だと登録できない" do
      @user.first_name = "abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input Kanji characters.")
      end

      it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが半角英字だと登録できない" do
      @user.last_name_kana = "abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end

      it "first_name_kanaが半角英字だと登録できない" do
      @user.first_name_kana = "abcd"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it "last_name_kanaが全角ひらがなだと登録できない" do
      @user.last_name_kana = "たなか"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end

      it "first_name_kanaが全角ひらがなだと登録できない" do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it "birthday_dateが空だと登録できない" do
      @user.birthday_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday date can't be blank")
      end
   end
  end
 end
end