class CreateIssues < ActiveRecord::Migration
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
