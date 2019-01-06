class AddPageCounterCacheToStories < ActiveRecord::Migration[4.2]
  def change
    add_column :stories, :pages_count, :integer
  end
end
