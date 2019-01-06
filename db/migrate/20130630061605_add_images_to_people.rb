# frozen_string_literal: true

class AddImagesToPeople < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :people, :image
  end

  def self.down
    remove_attachment :people, :image
  end
end
