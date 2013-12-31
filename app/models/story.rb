class Story < ActiveRecord::Base
  attr_accessible :cover_image, :cover_image_file_name, :cover_image_content_type, :cover_image_file_size, :cover_image_updated_at, :name, :story_pages, :story_pages_attributes, :person_ids
  has_attached_file :cover_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/default_images/story/:style/default.png"
  has_many :pages
  has_and_belongs_to_many :people

  scope :recent, ->(num) { order('created_at DESC').limit(num) }
end
