class AddIndicesToPeopleStories < ActiveRecord::Migration
  def change
    add_index :people_stories, :story_id
    add_index :people_stories, :person_id
  end
end
