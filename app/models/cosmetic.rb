class Cosmetic < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :color
  belongs_to :usage_count

  validates :name, :category, :stock_count, presence: true
  # 「開封日(opened_at)が1年以上前」のデータを取得する定義
  scope :expired, -> { where("open_date < ?", 1.year.ago) }
end
