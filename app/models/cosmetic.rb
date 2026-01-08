class Cosmetic < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre
  belongs_to :color
  belongs_to :usage_count

  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :genre_id, presence: true
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'は0以上の半角整数で入力してください' }
  validates :usage_count_id, presence: true

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true, message: 'は0以上の半角整数で入力してください' }
  validates :image, content_type: { in: %w[image/jpeg image/png], message: 'はJPEGまたはPNG形式にしてください' },
                    size: { less_than: 5.megabytes, message: 'は5MB未満のファイルを選択してください' }
  # 「開封日(opened_at)が1年以上前」のデータを取得する定義
  scope :expired, -> { where("open_date < ?", 1.year.ago) }
end
