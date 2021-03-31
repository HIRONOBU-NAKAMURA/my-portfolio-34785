require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '投稿機能' do
    before do
      @post = FactoryBot.build(:post)
    end
    context '投稿が正常にできるとき' do
      it '画像とコンテンツがあれば投稿できる' do
        expect(@post).to be_valid
      end
      it 'コンテンツがあれば登録できる' do
        @post.image = nil
        expect(@post).to be_valid
      end
    end
    context '投稿が正常にできないとき' do
      it 'コンテンツが空では登録できない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('コンテンツを入力してください')
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
