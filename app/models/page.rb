class Page < ActiveRecord::Base
  attr_accessible :image, :story_id
  has_attached_file :image, styles: { original: "945>", thumb: "70>" }, :default_url => "/images/:style/missing.png"
  belongs_to :story
  acts_as_list scope: :story

  default_scope :order => 'position ASC'
  scope :recent, ->(num) { order('created_at DESC').limit(num) }

end
