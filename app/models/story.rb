# A Story is a collection of pages, with one or more people as creators.
class Story <  ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  include Filterable
  include Rateable

  has_attached_file :cover_image,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/default_images/:style/story.png'
  has_many :pages
  accepts_nested_attributes_for :pages, allow_destroy: true
  has_and_belongs_to_many :people

  scope :alphabetical, -> { order('name ASC') }
  scope :recent, ->(num) { order('updated_at DESC').limit(num) }
  scope :with_pages, lambda {
    where('(select count(*) from pages where story_id=stories.id) > 0')
  }

  validates_attachment :cover_image,
                       content_type: { content_type: ['image/jpg',
                                                      'image/jpeg',
                                                      'image/gif',
                                                      'image/png'] },
                       size: { in: 0..5.megabytes }
  validates :name, presence: true, uniqueness: true

  def page_count
    page_count = pages.count
    page_count += 1 if self.blue?
    page_count += 1 if self.unfinished?
    page_count
  end

  def length_category
    case page_count
    when 0 then :empty
    when 1 then :one_page
    when 2..7 then :short
    when 8..15 then :medium
    when 16..31 then :long
    else; :epic
    end
  end

  def by_same_creators
    related_stories = []
    people.each do |person|
      related_stories << person.stories
    end
    related_stories.flatten.uniq
  end

  def badge
    month_ago = 1.month.ago.utc
    if created_at > month_ago
      :new
    elsif pages.last(2).all?{|page| page.created_at > month_ago}
      :new_pages
    elsif pages.last.created_at > month_ago
      :new_page
    end
  end

end
