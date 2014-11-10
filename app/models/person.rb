# An author, artistor other creator
class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_attached_file :image,
                    styles: { original: '300x300>', thumb: '100x100>' },
                    default_url: '/default_images/:style/person.png'
  has_and_belongs_to_many :stories

  scope :alphabetical, -> { order('name ASC') }
  scope :recent, ->(num) { order('updated_at DESC').limit(num) }

  validates_attachment :image,
                       content_type: { content_type: ['image/jpg',
                                                      'image/jpeg',
                                                      'image/gif',
                                                      'image/png'] },
                       size: { in: 0..5.megabytes }
  validates :name, presence: true, uniqueness: true
end
