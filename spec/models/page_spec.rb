# frozen_string_literal: true

# spec/models/contact.rb
require 'spec_helper'

describe Page do
  it 'has a valid factory' do
    page = FactoryBot.create(:page)
    expect(page).to be_valid
  end
  it 'is invalid without an image' do
    page = FactoryBot.build(:page, image_file_name: nil)
    expect(page).not_to be_valid
  end
  it 'is invalid with a non-image MIME type' do
    page = FactoryBot.build(:page, image_content_type: 'audio/mp4')
    expect(page).not_to be_valid
  end
  it 'is valid with a MIME type image/jpeg' do
    page = FactoryBot.build(:page, image_content_type: 'image/jpeg')
    expect(page).to be_valid
  end
  it 'is valid with a MIME type image/jpg' do
    page = FactoryBot.build(:page, image_content_type: 'image/jpg')
    expect(page).to be_valid
  end
  it "is invalid with an image that's too large" do
    page = FactoryBot.build(:page, image_file_size: 10.megabytes)
    expect(page).not_to be_valid
  end
end
