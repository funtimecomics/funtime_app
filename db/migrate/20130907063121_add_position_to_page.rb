class AddPositionToPage < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :position, :integer
  end
end
