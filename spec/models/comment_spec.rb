require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントが正常に投稿できるとき' do
      it 'テキストがあれば投稿できること' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが正常に投稿できないとき' do
      it 'テキストが空では投稿できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('テキストを入力してください')
      end
      it '投稿記事に紐付いていいないと投稿できないこと' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Postを入力してください')
      end
      it 'ユーザーに紐付いていないと投稿できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
