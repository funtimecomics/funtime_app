class AddPageCounterCacheToStories < ActiveRecord::Migration
  def change
    add_column :stories, :pages_count, :integer
  end
end
