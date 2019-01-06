# frozen_string_literal: true

class AddSlugToStories < ActiveRecord::Migration[4.2]
  def change
    add_column :stories, :slug, :string
    add_index :stories, :slug
  end
end
