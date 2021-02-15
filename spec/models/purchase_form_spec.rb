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

  end

  context '商品購入が上手くいかない時' do

    it "address_numberが空では登録できないこと" do
      @purchase_form.address_number= nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Address number can't be blank", "Address number is invalid")
    end

    it "address_numberが全角数字では登録できないこと" do
      @purchase_form.address_number= '１２３ー２３４５'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Address number is invalid")
    end

    it "prefecture_idが空では登録できないこと" do
      @purchase_form.prefecture_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank", "Prefecture Please select")
    end

    it "municipalitiesが空では登録できないこと" do
      @purchase_form.municipalities = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Municipalities can't be blank")
    end

    it "addressが空では登録できないこと" do
      @purchase_form.address = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
    end


    it "phone_numberが空では登録できないこと" do
      @purchase_form.phone_number = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
    end

    it "phone_numberが全角数字では登録できないこと" do
      @purchase_form.phone_number = '１２３４５６７８９１２'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number Input only number")
    end

    it "tokenが空では登録できない" do
      @purchase_form.token = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
    end

    it "user_idが空では登録できない" do
      @purchase_form.user_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      
    end

    it "item_idが空では登録できない" do
      @purchase_form.item_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
    end

  end
end
end