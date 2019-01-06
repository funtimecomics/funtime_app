# frozen_string_literal: true

class AddRatingToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :rating, :integer
  end
end
