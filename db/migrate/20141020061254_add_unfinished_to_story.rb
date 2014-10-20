class AddUnfinishedToStory < ActiveRecord::Migration
  def change
    add_column :stories, :unfinished, :boolean
  end
end
