class AddPageCounterCacheToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :pages_count, :integer
  end
end
