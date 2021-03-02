require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    sleep(0.1)
end

describe '商品購入機能' do
  context '商品購入が上手くいくとき' do
    it 'address_numberとprefecture_idとmunicipalitiesとaddressとphone_numberとtoken、user_id、item_idが存在すれば登録できること' do
      expect(@purchase_form).to be_valid
    end

    it "building_nameが空でも登録できる事" do
      @purchase_form.building_name = nil
      expect(@purchase_form).to be_valid
    end

  end

  context '商品購入が上手くいかない時' do

    it "address_numberが空では登録できないこと" do
      @purchase_form.address_number= nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Address numberを入力してください", "Address numberは不正な値です")
    end

    it "address_numberが全角数字では登録できないこと" do
      @purchase_form.address_number= '１２３ー２３４５'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Address numberは不正な値です")
    end

    it "prefecture_idが空では登録できないこと" do
      @purchase_form.prefecture_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Prefectureを入力してください", "Prefectureは数値で入力してください")
    end

     it "prefecture_idが0以外出なければ登録できない事" do
      @purchase_form.prefecture_id = 0
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Prefectureは0以外の値にしてください")
     end

    it "municipalitiesが空では登録できないこと" do
      @purchase_form.municipalities = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Municipalitiesを入力してください")
    end

    it "addressが空では登録できないこと" do
      @purchase_form.address = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Addressを入力してください")
    end


    it "phone_numberが空では登録できないこと" do
      @purchase_form.phone_number = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone numberを入力してください", "Phone numberは不正な値です")
    end

    it "phone_numberが全角数字では登録できないこと" do
      @purchase_form.phone_number = '１２３４５６７８９１２'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone numberは不正な値です")
    end

    it "phone_numberが英数混合では登録できないこと" do
      @purchase_form.phone_number = '12g1h2h3h33'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone numberは不正な値です")
    end

    it "tokenが空では登録できない" do
      @purchase_form.token = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Tokenを入力してください")
    end

    it "user_idが空では登録できない" do
      @purchase_form.user_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Userを入力してください")
    end

    it "item_idが空では登録できない" do
      @purchase_form.item_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Itemを入力してください")
    end

    it "電話番号が１２桁以上では登録できない事" do
      @purchase_form.phone_number = "123456789123"
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone numberは不正な値です")
    end

  end
end
end

