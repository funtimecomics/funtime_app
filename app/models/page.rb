# A single comics page
class Page < ActiveRecord::Base
  delegate :name, to: :story, prefix: true

  has_attached_file :image,
                    styles: { original: '945>', medium: '300>', thumb: '70>' },
                    default_url: '/images/:style/missing.png'
  belongs_to :story, counter_cache: true, touch: true
  belongs_to :issue, counter_cache: true, touch: true
  acts_as_list column: :story_page_number, scope: :story, top_of_list: 1
  acts_as_list column: :issue_page_number, scope: :issue, top_of_list: 1

  scope :ordered_for_story, -> { order('story_page_number ASC') }
  scope :ordered_for_issue, -> { order('issue_page_number ASC') }
  scope :recent, ->(num) { order('created_at DESC').limit(num) }

  validates_attachment :image,
                       presence: true,
                       content_type: { content_type: ['image/jpg',
                                                      'image/jpeg',
                                                      'image/gif',
                                                      'image/png'] },
                       size: { in: 0..5.megabytes }

  def image_url
    image.url(:original)
  end
end
