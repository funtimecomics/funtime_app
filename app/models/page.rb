class Page < ActiveRecord::Base
  delegate :name, :to => :story, :prefix => true

  has_attached_file :image, styles: { original: "945>", thumb: "70>" }, :default_url => "/images/:style/missing.png"
  belongs_to :story, counter_cache: true
  acts_as_list scope: :story

  scope :ordered, -> { order('position ASC') }
  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  validates_attachment :image,
    :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..5.megabytes }
  validates :position, presence: true, uniqueness: { scope: :story_id }
  validates :story, presence: true

end
