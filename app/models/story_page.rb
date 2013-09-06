class StoryPage < ActiveRecord::Base
  attr_accessible :page_number, :story_id, :page_id, :pages_attributes
  belongs_to :story
  belongs_to :page
  accepts_nested_attributes_for :page
end
