class Story < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  attr_accessible :cover_image, :cover_image_file_name, :cover_image_content_type, :cover_image_file_size, :cover_image_updated_at, :name, :story_pages, :story_pages_attributes, :person_ids
  has_attached_file :cover_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/default_images/:style/story.png"
  has_many :pages
  has_and_belongs_to_many :people

  scope :alphabetically, order("name ASC")
  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  validates_uniqueness_of :name
end
