# spec/models/contact.rb
require 'spec_helper'

describe Person do
  it 'has a valid factory' do
    person = FactoryGirl.create(:person)
    expect(person).to be_valid
  end
  it 'is valid without an image' do
    person = FactoryGirl.build(:person, image_file_name: nil)
    expect(person).to be_valid
  end
  it 'is invalid with a non-image MIME type' do
    person = FactoryGirl.build(:person, image_content_type: 'audio/mp4')
    expect(person).not_to be_valid
  end
  it 'is valid with a MIME type image/jpeg' do
    person = FactoryGirl.build(:person, image_content_type: 'image/jpeg')
    expect(person).to be_valid
  end
  it 'is valid with a MIME type image/jpg' do
    person = FactoryGirl.build(:person, image_content_type: 'image/jpg')
    expect(person).to be_valid
  end
  it "is invalid with an image that's too large" do
    person = FactoryGirl.build(:person, image_file_size: 10.megabytes)
    expect(person).not_to be_valid
  end
  it 'is invalid without a name' do
    person = FactoryGirl.build(:person, name: nil)
    expect(person).not_to be_valid
  end
  it 'does not allow duplicate names' do
    FactoryGirl.create(:person, name: 'foo')
    person = FactoryGirl.build(:person, name: 'foo')
    expect(person).not_to be_valid
  end
  it 'allows long bio text' do
    person = FactoryGirl.build(:person, bio: Faker::Lorem.characters(1024))
    expect(person.save).to eq true
  end
end
