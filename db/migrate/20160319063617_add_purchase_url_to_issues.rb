# frozen_string_literal: true

class AddPurchaseUrlToIssues < ActiveRecord::Migration[4.2]
  def change
    add_column :issues, :purchase_url, :string
  end
end
