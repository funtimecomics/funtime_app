class AddIndicesToPeopleStories < ActiveRecord::Migration[4.2]
  def change
    add_index :people_stories, :story_id
    add_index :people_stories, :person_id
  end
end
