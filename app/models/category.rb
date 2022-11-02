class Category < ApplicationRecord
    validates :title, presence: true, length: {maximum: 10}
    has_many :tasks, dependent: :destroy
    belongs_to :user
end
