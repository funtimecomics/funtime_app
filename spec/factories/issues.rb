FactoryGirl.define do
  factory :issue do
    title { Faker::Lorem.sentence }
    slug { Faker::Internet.slug }
    issue_number "11"
    cover_image_file_name "foo.png"
    cover_image_content_type "image/jpg"
    cover_image_file_size 2.megabytes
    position 1
  end
end
