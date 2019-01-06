# frozen_string_literal: true

# spec/models/contact.rb
require 'spec_helper'

describe Person do
  it 'has a valid factory' do
    person = FactoryBot.create(:person)
    expect(person).to be_valid
  end
  it 'is valid without an image' do
    person = FactoryBot.build(:person, image_file_name: nil)
    expect(person).to be_valid
  end
  it 'is invalid with a non-image MIME type' do
    person = FactoryBot.build(:person, image_content_type: 'audio/mp4')
    expect(person).not_to be_valid
  end
  it 'is valid with a MIME type image/jpeg' do
    person = FactoryBot.build(:person, image_content_type: 'image/jpeg')
    expect(person).to be_valid
  end
  it 'is valid with a MIME type image/jpg' do
    person = FactoryBot.build(:person, image_content_type: 'image/jpg')
    expect(person).to be_valid
  end
  it "is invalid with an image that's too large" do
    person = FactoryBot.build(:person, image_file_size: 10.megabytes)
    expect(person).not_to be_valid
  end
  it 'is invalid without a name' do
    person = FactoryBot.build(:person, name: nil)
    expect(person).not_to be_valid
  end
  it 'does not allow duplicate names' do
    FactoryBot.create(:person, name: 'foo')
    person = FactoryBot.build(:person, name: 'foo')
    expect(person).not_to be_valid
  end
  it 'allows long bio text' do
    person = FactoryBot.build(:person, bio: Faker::Lorem.characters(1024))
    expect(person.save).to eq true
  end
end
