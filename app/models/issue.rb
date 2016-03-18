# A Funtime issue, showing how the stories were originally published.
class Issue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_attached_file :cover_image,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/default_images/:style/issue.png"
  has_many :pages

  validates_attachment :cover_image,
                       presence: true,
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
