FactoryGirl.define do
  factory :story do
    name { Faker::Lorem.sentence }
    slug { Faker::Internet.slug }
    cover_image_file_name 'foo.png'
    cover_image_content_type 'image/jpg'
    cover_image_file_size 2.megabytes
  end
end
