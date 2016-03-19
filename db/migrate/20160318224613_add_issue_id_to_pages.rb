class AddIssueIdToPages < ActiveRecord::Migration
  def change
    add_belongs_to :pages, :issue
  end
end
