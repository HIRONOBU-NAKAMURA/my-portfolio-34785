class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments
  validates :name, presence: true,length: {maximum: 30}

  # 試作feedの定義
  # 完全な実装は次章の「ユーザーをフォローする」を参照
  def feed
    Post.where('user_id = ?', id)
  end

  def self.search(search)
    if search != ''
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
