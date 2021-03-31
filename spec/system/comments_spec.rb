require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @post = FactoryBot.create(:post)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはコメント投稿ページでコメントできる' do
    sign_in(@post.user)
    visit post_path(@post)
    fill_in 'comment_text', with: @comment
    expect  do
      find('input[name="commit"]').click
    end.to change { Comment.count }.by(1)
    expect(current_path).to eq(post_path(@post))
    expect(page).to have_content @comment
  end
end
