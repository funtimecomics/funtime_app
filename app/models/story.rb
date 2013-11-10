class Story < ActiveRecord::Base
  attr_accessible :name, :story_pages, :story_pages_attributes, :person_ids
  has_many :pages
  has_and_belongs_to_many :people

  def image
    if pages
      pages.first.image
    else
      nil
    end
  end
end
