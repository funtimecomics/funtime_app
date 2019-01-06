class ChangePeopleBioToText < ActiveRecord::Migration[4.2]
def up
    change_column :people, :bio, :text
end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :people, :bio, :string
end
end
