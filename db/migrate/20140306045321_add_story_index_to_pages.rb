# frozen_string_literal: true

class AddStoryIndexToPages < ActiveRecord::Migration[4.2]
  def change
    add_index :pages, :story_id
  end
end
