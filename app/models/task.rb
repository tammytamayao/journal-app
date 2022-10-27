class Task < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :deadline, presence: true
  belongs_to :category
  belongs_to :user
end
