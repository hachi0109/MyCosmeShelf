class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cosmetic
  belongs_to_active_hash :status

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: 'は1〜5の整数で入力してください' }
  validates :status_id, inclusion: { in: Status.all.map(&:id), message: 'を正しく選択してください' }
end
