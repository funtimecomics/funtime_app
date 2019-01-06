class AddIssueIdToPages < ActiveRecord::Migration[4.2]
  def change
    add_belongs_to :pages, :issue
  end
end
