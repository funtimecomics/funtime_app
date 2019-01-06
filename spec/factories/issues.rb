# frozen_string_literal: true

FactoryBot.define do
  factory :issue do
    title { Faker::Lorem.sentence }
    slug { Faker::Internet.slug }
    sequence(:issue_number, &:to_s)
    cover_image_file_name { 'foo.png' }
    cover_image_content_type { 'image/jpg' }
    cover_image_file_size { 2.megabytes }
    position { 1 }
  end
end
