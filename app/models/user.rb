class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
            format: {with: VALID_PASSWORD_REGEX,
            message: "は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります"}
  validates :email, presence: true
  validates :first_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana_notation, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana_notation, presence: true,format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true

  has_many :items
  has_many :purchases
end
