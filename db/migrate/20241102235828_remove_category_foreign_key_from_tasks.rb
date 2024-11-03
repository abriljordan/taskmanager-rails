class RemoveCategoryForeignKeyFromTasks < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :tasks, :categories
    remove_foreign_key :tasks, :users
  end
end
