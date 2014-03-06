FactoryGirl.define do
  factory :person do
    name { Faker::Name.name }
    bio { Faker::Lorem.paragraph }
    image_file_name "foo.png"
    image_content_type "image/png"
    image_file_size 2.megabytes
  end
end
