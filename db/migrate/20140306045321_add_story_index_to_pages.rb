class AddStoryIndexToPages < ActiveRecord::Migration
  def change
    add_index :pages, :story_id
  end
end
