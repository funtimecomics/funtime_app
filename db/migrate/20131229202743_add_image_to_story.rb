class AddImageToStory < ActiveRecord::Migration
  def self.up
    add_attachment :stories, :cover_image
  end

  def self.down
    remove_attachment :stories, :cover_image
  end
end
