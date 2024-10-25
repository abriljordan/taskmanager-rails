class AddDescriptionToTags < ActiveRecord::Migration[7.2]
  def change
    add_column :tags, :description, :text
  end
end
