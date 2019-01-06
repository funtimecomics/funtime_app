class CreateStories < ActiveRecord::Migration[4.2]
  def change
    create_table :stories do |t|
      t.string :name
      t.timestamps
    end
  end
end
