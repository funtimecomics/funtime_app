class CreateStoryPages < ActiveRecord::Migration
  def change
    create_table :story_pages do |t|
      t.belongs_to :story
      t.belongs_to :page
      t.integer :page_number
      t.timestamps
    end
  end
end
