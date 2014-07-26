class AddRatingToStories < ActiveRecord::Migration
  def change
    add_column :stories, :rating, :integer
  end
end
