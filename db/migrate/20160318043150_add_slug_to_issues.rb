class AddSlugToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :slug, :string
    add_index :issues, :slug
  end
end
