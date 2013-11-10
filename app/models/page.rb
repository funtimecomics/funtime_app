class Page < ActiveRecord::Base
  attr_accessible :image, :story_id
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  belongs_to :story
  acts_as_list scope: :story
  default_scope :order => 'position ASC'
end
