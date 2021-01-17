require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品出品機能' do
      context '商品登録がうまくいくとき' do
        it "nameとpriceとdescription_of_item、category_id、date_of_shipment_id、prefecture_id、product_condition_id、shipping_charge_id、imageが存在すれば登録できること" do
          expect(@item).to be_valid
        end

        it "priceは半角数字なら登録できること" do
          @item.price = 800000
          expect(@item).to be_valid
        end

        it "priceが300円以上で登録できること" do
          @item.price >= 300
          expect(@item).to be_valid
        end

        it "priceが9999999円以下で登録できること" do
          @item.price <= 9999999
          expect(@item).to be_valid
        end
      end
    
      context '出品機能がうまくいかないとき' do

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price should be half-width numbers")
    end


    it "description_of_itemが空では登録できないこと" do
      @item.description_of_item = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description of item can't be blank")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it "category_idが0を選択している場合保存できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

    it "date_of_shipment_idが空では登録できないこと" do
      @item.date_of_shipment_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Date of shipment is not a number")
    end

    it "date_of_shipment_idが0を選択している場合保存できない" do
      @item.date_of_shipment_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end

    it "prefecture_idが0を選択している場合保存できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

    it "product_condition_idが空では登録できないこと" do
      @item.product_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition is not a number")
    end

    it "product_conditon_idが0を選択している場合保存できない" do
      @item.product_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

    it "shipping_charge_idが空では登録できないこと" do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end

    it "shipping_charge_idが0を選択している場合保存できない" do
      @item.shipping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
  end
end
