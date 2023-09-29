require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    context '商品を出品できるとき' do
      it '全ての項目が正しく入力できていれば出品できる' do
        expect(@item).to be_valid
      end

      it 'userが紐づいていれば登録できる' do
        @item.user = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'item_imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image must be attached')
      end

      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが未選択だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'ship_areaが未選択だと出品できない' do
        @item.ship_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship area can't be blank")
      end

      it 'ship_chargeが未選択だと出品できない' do
        @item.ship_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship charge can't be blank")
      end

      it 'ship_dayが未選択だと出品できない' do
        @item.ship_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day can't be blank")
      end

      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number.")
      end

      it 'priceが¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'priceが¥9999999より多い時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end  
    end
  end
end
