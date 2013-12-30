class Story < ActiveRecord::Base
  attr_accessible :cover_image, :name, :story_pages, :story_pages_attributes, :person_ids
  has_attached_file :cover_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/default_images/story/:style/default.png"
  has_many :pages
  has_and_belongs_to_many :people
end
