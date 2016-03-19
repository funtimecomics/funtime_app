class AddPurchaseUrlToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :purchase_url, :string
  end
end
