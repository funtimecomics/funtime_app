# frozen_string_literal: true

# For classes that can be given a colour rating for age-appropriateness
module Rateable
  extend ActiveSupport::Concern

  included do
    enum rating: %i[green yellow red blue]
    scope :rating, ->(rating_text) { where(rating: Story.ratings[rating_text]) }
  end
end
