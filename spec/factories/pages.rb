# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :page do
    image_file_name { 'foo.png' }
    image_content_type { 'image/jpg' }
    image_file_size { 2.megabytes }
    story_page_number { 1 }
    story
    issue_page_number { 1 }
    issue
  end
end
