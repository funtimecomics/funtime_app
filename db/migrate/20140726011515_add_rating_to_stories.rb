# frozen_string_literal: true

class AddRatingToStories < ActiveRecord::Migration[4.2]
  def change
    add_column :stories, :rating, :integer
  end
end
