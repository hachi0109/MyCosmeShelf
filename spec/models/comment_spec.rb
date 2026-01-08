require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'マイ口コミ投稿' do
    context 'マイ口コミが投稿できる場合' do
      it 'contentとrating、status_idが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'マイ口コミが投稿できない場合' do
      it 'contentが空では保存できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'ratingが空では保存できない' do
        @comment.rating = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Rating can't be blank")
      end
      it 'status_idが空では保存できない' do
        @comment.status_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Status を正しく選択してください")
      end
      it 'ratingは1～5の整数でないと保存できない' do
        @comment.rating = 6
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Rating は1〜5の整数で入力してください")
      end
      it 'status_idは1～3の整数でないと保存できない' do
        @comment.status_id = 4
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Status を正しく選択してください")
      end
      it 'ratingは小数では保存できない' do
        @comment.rating = 2.5
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Rating は1〜5の整数で入力してください")
      end
      it 'status_idが0では保存できない' do
        @comment.status_id = 0
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Status を正しく選択してください")
      end
      it 'cosmeticが紐付いていないと保存できない' do
        @comment.cosmetic = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Cosmetic must exist")
      end
    end
  end
end
