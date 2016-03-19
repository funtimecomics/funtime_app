class AddPageNumbers < ActiveRecord::Migration
  def change
    rename_column :pages, :position, :story_page_number
    add_column :pages, :issue_page_number, :integer
  end
end
