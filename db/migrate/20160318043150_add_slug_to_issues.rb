# frozen_string_literal: true

class AddSlugToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :slug, :string
    add_index :issues, :slug
  end
end
