# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[4.2]
  def change
    create_table :pages do |t|
      t.belongs_to :story
      t.timestamps
    end
  end
end
