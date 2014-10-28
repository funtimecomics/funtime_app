class Story < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  include Filterable

  has_attached_file :cover_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/default_images/:style/story.png"
  has_many :pages
  accepts_nested_attributes_for :pages, :allow_destroy => true
  has_and_belongs_to_many :people

  enum rating: [:green, :yellow, :red, :blue]

  scope :rating, -> (rating_text) { where(rating: Story.ratings[rating_text]) }
  scope :alphabetical, -> { order("name ASC") }
  scope :recent, ->(num) { order('updated_at DESC').limit(num) }
  scope :with_pages, -> { where("(select count(*) from pages where story_id=stories.id) > 0") }


  validates_attachment :cover_image,
    :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..5.megabytes }
  validates :name, presence: true, uniqueness: true

  def page_count
    page_count = pages.count
    page_count += 1 if self.blue?
    page_count += 1 if self.unfinished?
    page_count
  end

  def length_category
    case page_count
    when 0
      "empty"
    when 1
      "one_page"
    when 2..7
      "short"
    when 8..15
      "medium"
    when 16..31
      "long"
    else
      "epic"
    end
  end

end
