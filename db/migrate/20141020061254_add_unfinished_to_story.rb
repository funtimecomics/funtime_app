# frozen_string_literal: true

class AddUnfinishedToStory < ActiveRecord::Migration[4.2]
  def change
    add_column :stories, :unfinished, :boolean
  end
end
