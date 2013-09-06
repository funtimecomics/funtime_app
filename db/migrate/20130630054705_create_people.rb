class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :bio

      t.timestamps
    end

    create_table :stories_people do |t|
      t.belongs_to :story
      t.belongs_to :person
    end
  end
end
