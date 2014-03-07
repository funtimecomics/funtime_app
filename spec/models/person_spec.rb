# spec/models/contact.rb
require 'spec_helper'

describe Person do
  it "has a valid factory" do
    FactoryGirl.create(:person).should be_valid
  end
  it "is valid without an image" do
    FactoryGirl.build(:person, image_file_name: nil).should be_valid
  end
  it "is invalid with a non-image MIME type" do
    FactoryGirl.build(:person, image_content_type: 'audio/mp4').should_not be_valid
  end
  it "is valid with a MIME type image/jpeg" do
    FactoryGirl.build(:person, image_content_type: 'image/jpeg').should be_valid
  end
  it "is valid with a MIME type image/jpg" do
    FactoryGirl.build(:person, image_content_type: 'image/jpg').should be_valid
  end
  it "is invalid with an image that's too large" do
    FactoryGirl.build(:person, image_file_size: 10.megabytes).should_not be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:person, name: nil).should_not be_valid
  end
  it "does not allow duplicate names" do
    FactoryGirl.create(:person, name: 'foo')
    FactoryGirl.build(:person, name: 'foo').should_not be_valid
  end
end
