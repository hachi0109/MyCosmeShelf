class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :cosmetic
  belongs_to_active_hash :status

  validates :content, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :status_id, numericality: { other_than: 0 } 
end
