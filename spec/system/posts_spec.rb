require 'rails_helper'

RSpec.describe "コンテンツの投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end
  context '投稿ができるとき' do
    it 'ログインしたユーザーは新規登録ができる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('投稿')
      fill_in 'post_content', with: @post.content
      attach_file 'post[image]',"public/images/test_image.png"
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)
      expect(page).to have_content(@post.content)
      expect(current_path).to eq(root_path)
    end
  end
  context '投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_link('投稿')
    end
  end
end

RSpec.describe 'コンテンツのコメントページ', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  it 'ログインしたユーザーはコンテンツコメントページに遷移してコメント投稿欄が表示される' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @post.user.email
    fill_in 'パスワード', with: @post.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    visit post_path(@post)
    expect(page).to have_content("#{@post.content}")
    expect(page).to have_selector 'form'
  end
end
