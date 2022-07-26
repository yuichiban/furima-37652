require 'rails_helper'

RSpec.describe BuyerShopping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_shopping = FactoryBot.build(:buyer_shopping, user_id: user.id, item_id: item.id)
    end

  describe '商品の購入' do
    context '商品の購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_shopping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_shopping.building_name = ''
        expect(@buyer_shopping).to be_valid
      end
      it "tokenがあれば保存ができること" do
        expect(@buyer_shopping).to be_valid
      end
    end
    context '商品の購入ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @buyer_shopping.post_code = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_shopping.post_code = '1234567'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県の入力がないと出品できない' do
        @buyer_shopping.prefecture_id = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県の入力が「---」のとき出品できない' do
        @buyer_shopping.prefecture_id = 1
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @buyer_shopping.municipalities = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyer_shopping.address = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyer_shopping.phone_number = ''
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下では登録できない' do
        @buyer_shopping.phone_number = '000000000'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12文字以上では登録できない' do
        @buyer_shopping.phone_number = '000000000000'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が半角数値以外では登録できない' do
        @buyer_shopping.phone_number = 'aiueoアイウエオ'
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include('Phone number is invalid')
      end
      it "tokenが空では登録できないこと" do
        @buyer_shopping.token = nil
        @buyer_shopping.valid?
        expect(@buyer_shopping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


