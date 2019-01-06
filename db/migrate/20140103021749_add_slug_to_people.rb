# frozen_string_literal: true

class AddSlugToPeople < ActiveRecord::Migration[4.2]
  def change
    add_column :people, :slug, :string
    add_index :people, :slug
  end
end
