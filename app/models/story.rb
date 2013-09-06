class Story < ActiveRecord::Base
  attr_accessible :name, :story_pages, :story_pages_attributes
  has_many :story_pages
  has_many :pages, through: :story_pages
  has_and_belongs_to_many :people
end
