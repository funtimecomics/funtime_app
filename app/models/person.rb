class Person < ActiveRecord::Base
  attr_accessible :bio, :image, :name
  has_attached_file :image, styles: { original: "300x300>", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"
  has_and_belongs_to_many :stories
end
