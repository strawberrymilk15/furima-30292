class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :email
  validates :birth_day

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,
            format: {with: VALID_PASSWORD_REGEX,
            message: "は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります"}

  with_options format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
  validates :first_name
  validates :last_name
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
  validates :first_name_kana_notation
  validates :last_name_kana_notation
  end

end

  has_many :items
  has_many :purchases
end