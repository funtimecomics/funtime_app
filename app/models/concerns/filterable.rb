# For classes that can be filtered through scopes
module Filterable
  extend ActiveSupport::Concern

  # Provides a single filter method
  module ClassMethods
    def filter(filtering_params)
      results = where(nil) # Initialize a query
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
