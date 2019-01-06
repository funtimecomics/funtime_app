# frozen_string_literal: true

class AddDescriptionToPages < ActiveRecord::Migration[4.2]
  def change
    add_column :pages, :description, :text
  end
end
