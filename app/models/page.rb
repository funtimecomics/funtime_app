class Page < ActiveRecord::Base
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_one :story_page
  has_one :story, through: :story_page
end
