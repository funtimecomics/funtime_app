# frozen_string_literal: true

class AddPositionToPage < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :position, :integer
  end
end
