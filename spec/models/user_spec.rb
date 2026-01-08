require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、theme_color_idが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "theme_color_idが空では登録できない" do
        @user.theme_color_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Theme color can't be blank")
      end
      it "theme_color_idは数字でなければ登録できない" do
        @user.theme_color_id = 'i'
        @user.valid?
        expect(@user.errors.full_messages).to include("Theme color is not a number")
      end
      it "theme_color_idは2～5の整数でなければ登録できない" do
        @user.theme_color_id = '6.5'
        @user.valid?
        expect(@user.errors.full_messages).to include("Theme color must be an integer")
      end
      it "theme_color_idが1では登録できない" do
        @user.theme_color_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Theme color must be other than 1")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 130)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'nameが41文字以上では登録できない' do
        @user.name = 'a' * 41
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
    end
  end
end
