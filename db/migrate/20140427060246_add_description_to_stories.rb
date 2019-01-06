class AddDescriptionToStories < ActiveRecord::Migration[4.2]
  def change
    add_column :stories, :description, :text
  end
end
