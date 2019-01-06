# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[4.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :bio

      t.timestamps
    end

    create_table :people_stories do |t|
      t.belongs_to :story
      t.belongs_to :person
    end
  end
end
