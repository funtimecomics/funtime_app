# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    image_file_name "foo.png"
    image_content_type "image/jpg"
    image_file_size 2.megabytes
    position 1
    story
  end
end
