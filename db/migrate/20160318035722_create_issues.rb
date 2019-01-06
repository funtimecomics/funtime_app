# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[4.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :issue_number
      t.integer :position
      t.attachment :cover_image
      t.timestamps
    end
  end
end
