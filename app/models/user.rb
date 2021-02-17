class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,  presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birthday_date, presence: true
         
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX

        with_options presence: true do

          validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input Kanji characters."}
          validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input Kanji characters."}
          validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
          validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}

 end
end