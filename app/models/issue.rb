# A Funtime issue, showing how the stories were originally published.
class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  include Filterable
  include Rateable

  has_attached_file :cover_image,
                    styles: { medium: "500x500>", thumb: "300x300>" },
                    default_url: "/default_images/:style/issue.png"
  has_many :pages
  accepts_nested_attributes_for :pages

  scope :ordered, -> { order("position ASC") }

  validates_attachment :cover_image,
                       content_type: { content_type: ["image/jpg",
                                                      "image/jpeg",
                                                      "image/gif",
                                                      "image/png"] },
                       size: { in: 0..5.megabytes }
  validates :title, presence: true, uniqueness: true
  validates :issue_number, uniqueness: true
  validates :position, presence: true

  before_save :ensure_position

  private

  def ensure_position
    self.position ||= Issue.count + 1
  end
end
