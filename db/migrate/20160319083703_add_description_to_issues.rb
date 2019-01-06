# frozen_string_literal: true

class AddDescriptionToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :description, :text
  end
end
