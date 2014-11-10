# spec/models/contact.rb
require 'spec_helper'

describe Story do
  it 'has a valid factory' do
    story = FactoryGirl.create(:story)
    expect(story).to be_valid
  end
  it 'is invalid without an image' do
    story = FactoryGirl.build(:story, cover_image_file_name: nil)
    expect(story).not_to be_valid
  end
  it 'is invalid with a non-image MIME type' do
    story = FactoryGirl.build(:story, cover_image_content_type: 'audio/mp4')
    expect(story).not_to be_valid
  end
  it 'is valid with a MIME type image/jpeg' do
    story = FactoryGirl.build(:story, cover_image_content_type: 'image/jpeg')
    expect(story).to be_valid
  end
  it 'is valid with a MIME type image/jpg' do
    story = FactoryGirl.build(:story, cover_image_content_type: 'image/jpg')
    expect(story).to be_valid
  end
  it "is invalid with an image that's too large" do
    story = FactoryGirl.build(:story, cover_image_file_size: 10.megabytes)
    expect(story).not_to be_valid
  end
  it 'is invalid without a name' do
    story = FactoryGirl.build(:story, name: nil)
    expect(story).not_to be_valid
  end
  it 'does not allow duplicate names' do
    FactoryGirl.create(:story, name: 'foo')
    story = FactoryGirl.build(:story, name: 'foo')
    expect(story).not_to be_valid
  end

  describe '#page_count' do
    before :each do
      @story = FactoryGirl.create(:story)
      FactoryGirl.create(:page, story: @story, position: 1)
    end
    it 'counts number of pages for a standard story' do
      expect(@story.page_count).to eq 1
    end
    it 'counts an extra page for a blue story' do
      @story.rating = :blue
      expect(@story.page_count).to eq 2
    end
    it 'counts an extra page for an unfinished story' do
      @story.unfinished = true
      expect(@story.page_count).to eq 2
    end
  end

  describe '#length_category' do
    before :each do
      @story = FactoryGirl.create(:story)
    end
    it 'is empty for a 0 page story' do
      expect(@story.length_category).to eq 'empty'
    end
    it 'is one_page for a 1 page story' do
      add_pages(@story, 1)
      expect(@story.length_category).to eq 'one_page'
    end
    it 'is short for a 2..7 page story' do
      add_pages(@story, 2)
      expect(@story.length_category).to eq 'short'
    end
    it 'is medium for a 8..15 page story' do
      add_pages(@story, 8)
      expect(@story.length_category).to eq 'medium'
    end
    it 'is long for a 16..31 page story' do
      add_pages(@story, 16)
      expect(@story.length_category).to eq 'long'
    end
    it 'is epic for a >31 page story' do
      add_pages(@story, 32)
      expect(@story.length_category).to eq 'epic'
    end

  end
end

def add_pages(story, num_stories)
  (1..num_stories).each do |position|
    FactoryGirl.create(:page, story: story, position: i)
  end
end
