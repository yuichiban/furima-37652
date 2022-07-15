require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、date_of_birthが存在すれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordが半角英数字混合出ないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it '名字(全角)は、空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it '名前(全角)は、空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it '名字(全角)は、全角(漢字・ひらがな・カタカナ)の入力がないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it '名前(全角)は、全角(漢字・ひらがな・カタカナ)の入力がないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it '名字カナ(全角)は、空では登録ができない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
      end
      it '名前カナ(全角)は、空では登録ができない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end
      it '名字カナ(全角)は、全角(カタカナ)での入力がないと登録ができない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用してください")
      end
      it '名前カナ(全角)は、全角(カタカナ)での入力がないと登録ができない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
      end
      it '生年月日の入力がないと登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end