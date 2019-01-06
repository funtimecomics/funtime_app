class CreateControllers < ActiveRecord::Migration[4.2]
  def change
    create_table :controllers do |t|
      t.string :Pages

      t.timestamps
    end
  end
end
