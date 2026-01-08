require 'rails_helper'

RSpec.describe Cosmetic, type: :model do
  before do
    @cosmetic = FactoryBot.build(:cosmetic)
  end

  describe 'コスメ投稿' do
    context 'コスメが投稿できる場合' do
      it 'nameとgenre_id、usage_count_id、stockが存在していれば保存できる' do
        expect(@cosmetic).to be_valid
      end
      it 'priceが空でも保存できる' do
        @cosmetic.price = ''
        expect(@cosmetic).to be_valid
      end
      it 'brandが空でも保存できる' do
        @cosmetic.brand = ''
        expect(@cosmetic).to be_valid
      end
      it 'color_idが空でも保存できる' do
        @cosmetic.color_id = ''
        expect(@cosmetic).to be_valid
      end
      it 'purchase_dateが空でも保存できる' do
        @cosmetic.purchase_date = ''
        expect(@cosmetic).to be_valid
      end
      it 'open_dateが空でも保存できる' do
        @cosmetic.open_date = ''
        expect(@cosmetic).to be_valid
      end
      it 'official_urlが空でも保存できる' do
        @cosmetic.official_url = ''
        expect(@cosmetic).to be_valid
      end
      it 'is_favoriteが空でも保存できる' do
        @cosmetic.is_favorite = ''
        expect(@cosmetic).to be_valid
      end
    end
    context 'コスメが投稿できない場合' do
      it 'nameが空では保存できない' do
        @cosmetic.name = ''
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Name can't be blank")
      end
      it 'genre_idが空では保存できない' do
        @cosmetic.genre_id = ''
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Genre can't be blank")
      end
      it 'usage_count_idが空では保存できない' do
        @cosmetic.usage_count_id = ''
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Usage count can't be blank")
      end
      it 'stockが空では保存できない' do
        @cosmetic.stock = ''
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Stock can't be blank")
      end
      it 'nameが101文字以上では保存できない' do
        @cosmetic.name = 'a' * 101
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Name is too long (maximum is 100 characters)")
      end
      it 'stockが整数でないと保存できない' do
        @cosmetic.stock = '1.5'
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Stock は0以上の半角整数で入力してください")
      end
      it 'stockが負の数では保存できない' do
        @cosmetic.stock = -1
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Stock は0以上の半角整数で入力してください")
      end
      it 'priceが整数でないと保存できない' do
        @cosmetic.price = '10.5'
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Price は0以上の半角整数で入力してください")
      end
      it 'priceが負の数では保存できない' do
        @cosmetic.price = -100
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Price は0以上の半角整数で入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @cosmetic.user = nil
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("User must exist")
      end
      it '画像がJPEG/PNG以外では保存できない' do
        @cosmetic.image.attach(io: StringIO.new('dummy'), filename: 'test.txt', content_type: 'text/plain')
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Image はJPEGまたはPNG形式にしてください")
      end
      it '画像が5MBを超えると保存できない' do
        @cosmetic.image.attach(io: StringIO.new('a' * 5.1.megabytes), filename: 'large_image.png', content_type: 'image/png')
        @cosmetic.valid?
        expect(@cosmetic.errors.full_messages).to include("Image は5MB未満のファイルを選択してください")
      end
    end
  end
end
