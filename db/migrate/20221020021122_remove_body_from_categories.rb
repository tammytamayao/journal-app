class RemoveBodyFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :body, :text
  end
end
