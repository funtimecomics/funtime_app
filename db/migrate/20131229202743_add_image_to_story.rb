# frozen_string_literal: true

class AddImageToStory < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :stories, :cover_image
  end

  def self.down
    remove_attachment :stories, :cover_image
  end
end
