require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
     describe 'ユーザー新規登録' do
      context '新規登録がうまくいく時' do
    it "nameとemial、passwordとpassword_confirmation、nickname、first_nameとlast_name、first_name_kana_notaionとlast_kana_notation、birth_dayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

  end

    context '新規登録がうまくいかない時' do
      
    it "nicknameが空では登録できないこと" do
      @user.nickname= nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailには@が含まれていなければ登録できないこと' do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user =FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password =nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "encrypted_passwordがない場合は登録できない事" do
      @user.encrypted_password =nil
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end

    it "パスワードに英小文字が含まれない場合無効な状態である事" do
      @user.password = '1' + 'A' * 5
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります")
    end

    it "パスワードに英大文字が含まれない場合無効な状態である事" do
      @user.password = '1' + 'a' * 5
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります")
    end

    it "パスワードに数字が含まれない場合無効な状態である事" do
      @user.password = 'A' + 'a' * 5
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is too short (minimum is 6 characters)")
    end

    it "パスワードが13文字以上なら無効であること" do
      @user.password = '1A' + 'a' * 11
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password は半角6~12文字英大文字・小文字・数字それぞれ1文字以上含む必要があります")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角入力でなければ登録できない事' do
      @user.first_name = 'あ' + 'ｱ' + '安' * 4
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameが全角入力でなければ登録できない事" do
      @user.last_name = 'あ' + 'ｱ' + '安' * 4
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_name_kana_notationが空では登録できないこと" do
      @user.first_name_kana_notation=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana notation can't be blank")
    end

    it "first_name_kana_notationが全角カタカナでなければ登録できない事" do
      @user.first_name_kana_notation = 'ア' + 'ｱ' * 3
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana notation is invalid")
    end

    it "last_name_kana_notationが空では登録できないこと" do
      @user.last_name_kana_notation=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana notation can't be blank")
    end

    it "last_name_kana_notationが全角カタカナでなければ登録できない事" do
      @user.last_name_kana_notation = 'ア' + 'ｱ' * 3
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana notation is invalid")
    end


    it "birth_dayが空では登録できないこと" do
      @user.birth_day=nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
end
end
end
end