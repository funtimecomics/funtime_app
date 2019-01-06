class AddImageToPage < ActiveRecord::Migration[4.2]
  def self.up
    add_attachment :pages, :image
  end

  def self.down
    remove_attachment :pages, :image
  end
end
