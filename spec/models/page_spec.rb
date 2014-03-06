# spec/models/contact.rb
require 'spec_helper'

describe Page do
  it "has a valid factory" do
    FactoryGirl.create(:page).should be_valid
  end
  it "is invalid without an image" do
    FactoryGirl.build(:page, image_file_name: nil).should_not be_valid
  end
  it "is invalid with a non-image MIME type" do
    FactoryGirl.build(:page, image_content_type: 'audio/mp4').should_not be_valid
  end
  it "is valid with a MIME type image/jpeg" do
    FactoryGirl.build(:page, image_content_type: 'image/jpeg').should be_valid
  end
  it "is valid with a MIME type image/jpg" do
    FactoryGirl.build(:page, image_content_type: 'image/jpg').should be_valid
  end
  it "is invalid with an image that's too large" do
    FactoryGirl.build(:page, image_file_size: 10.megabytes).should_not be_valid
  end
  it "is invalid without a position" do
    FactoryGirl.build(:page, position: nil).should_not be_valid
  end
  it "does not allow duplicate positions per story" do
    story = FactoryGirl.create(:story)
    FactoryGirl.create(:page, story: story, position: 3)
    FactoryGirl.build(:page, story: story, position: 3).should_not be_valid
  end
end
