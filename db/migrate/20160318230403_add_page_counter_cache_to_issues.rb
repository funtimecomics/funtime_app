class AddPageCounterCacheToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :pages_count, :integer
  end
end
