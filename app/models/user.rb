class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :Nickname
         validates :last_name
         validates :first_name
         validates :last_name_kana
         validates :first_name_kana
         validates :birthday_date
         end
         
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX

         with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input Kanji characters."} do
         validates :last_name
         validates :first_name
         end

         with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
         validates :last_name_kana
         validates :first_name_kana
         end
        
end