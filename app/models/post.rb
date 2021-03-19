class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: '有効な画像形式である必要があります' },
                    size: { less_than: 5.megabytes,
                            message: '5MB以下である必要があります' }

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [700, 1200])
  end
end
