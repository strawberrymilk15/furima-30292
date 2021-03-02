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

      
      end
    
      context '出品機能がうまくいかないとき' do

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end

    it "priceが299円以下では登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
    end

    it "priceが10000000円以上では登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
    end

    it "priceが全角文字では登録できないこと" do
      @item.price = '８００００'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end

    it "priceが英数混合では登録できないこと" do
      @item.price = '1j3m2k'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end


    it "priceが半角英語のみでは登録できないこと" do
      @item.price = 'hguheuha'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
    end


    it "description_of_itemが空では登録できないこと" do
      @item.description_of_item = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品説明を入力してください")
    end

    it "category_idが空では登録できないこと" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
    end

    it "category_idが0を選択している場合保存できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは0以外の値にしてください")
    end

    it "date_of_shipment_idが空では登録できないこと" do
      @item.date_of_shipment_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください")
    end

    it "date_of_shipment_idが0を選択している場合保存できない" do
      @item.date_of_shipment_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は0以外の値にしてください")
    end

    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
    end

    it "prefecture_idが0を選択している場合保存できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域は0以外の値にしてください")
    end

    it "product_condition_idが空では登録できないこと" do
      @item.product_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品状態は数値で入力してください")
    end

    it "product_conditon_idが0を選択している場合保存できない" do
      @item.product_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("商品状態は0以外の値にしてください")
    end

    it "shipping_charge_idが空では登録できないこと" do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
    end

    it "shipping_charge_idが0を選択している場合保存できない" do
      @item.shipping_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は0以外の値にしてください")
    end

    it "imageが空では登録できないこと" do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
  end
end
  end
end
