class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  attr_accessible :bio, :image, :name
  has_attached_file :image, styles: { original: "300x300>", thumb: "100x100>" }, :default_url => "/default_images/:style/person.png"
  has_and_belongs_to_many :stories

  scope :alphabetically, order("name ASC")
  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  validates_uniqueness_of :name
end
