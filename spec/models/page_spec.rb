# spec/models/contact.rb
require 'spec_helper'

describe Page do
  it 'has a valid factory' do
    page = FactoryGirl.create(:page)
    expect(page).to be_valid
  end
  it 'is invalid without an image' do
    page = FactoryGirl.build(:page, image_file_name: nil)
    expect(page).not_to be_valid
  end
  it 'is invalid with a non-image MIME type' do
    page = FactoryGirl.build(:page, image_content_type: 'audio/mp4')
    expect(page).not_to be_valid
  end
  it 'is valid with a MIME type image/jpeg' do
    page = FactoryGirl.build(:page, image_content_type: 'image/jpeg')
    expect(page).to be_valid
  end
  it 'is valid with a MIME type image/jpg' do
    page = FactoryGirl.build(:page, image_content_type: 'image/jpg')
    expect(page).to be_valid
  end
  it "is invalid with an image that's too large" do
    page = FactoryGirl.build(:page, image_file_size: 10.megabytes)
    expect(page).not_to be_valid
  end
  it 'is invalid without a position' do
    page = FactoryGirl.build(:page, position: nil)
    expect(page).not_to be_valid
  end
  it 'does not allow duplicate positions per story' do
    story = FactoryGirl.create(:story)
    FactoryGirl.create(:page, story: story, position: 3)
    page = FactoryGirl.build(:page, story: story, position: 3)
    expect(page).not_to be_valid
  end
end
