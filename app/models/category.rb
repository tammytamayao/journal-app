class Category < ApplicationRecord
    validates :title, presence: true, length: {maximum: 10}
    #if a category is deleted, all associated tasks will also be deleted
    has_many :tasks, dependent: :destroy
    belongs_to :user
end
