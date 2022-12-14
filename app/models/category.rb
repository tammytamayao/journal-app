class Category < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :user }
    has_many :tasks, dependent: :destroy
    belongs_to :user
end
