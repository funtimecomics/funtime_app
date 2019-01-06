# spec/models/contact.rb
require "spec_helper"

describe Issue do
  it "has a valid factory" do
    issue = FactoryBot.create(:issue)
    expect(issue).to be_valid
  end
  it "is invalid with a non-image MIME type" do
    issue = FactoryBot.build(:issue, cover_image_content_type: "audio/mp4")
    expect(issue).not_to be_valid
  end
  it "is valid with a MIME type image/jpeg" do
    issue = FactoryBot.build(:issue, cover_image_content_type: "image/jpeg")
    expect(issue).to be_valid
  end
  it "is valid with a MIME type image/jpg" do
    issue = FactoryBot.build(:issue, cover_image_content_type: "image/jpg")
    expect(issue).to be_valid
  end
  it "is invalid with an image that's too large" do
    issue = FactoryBot.build(:issue, cover_image_file_size: 10.megabytes)
    expect(issue).not_to be_valid
  end
  it "is invalid without a title" do
    issue = FactoryBot.build(:issue, title: nil)
    expect(issue).not_to be_valid
  end
  it "does not allow duplicate titles" do
    FactoryBot.create(:issue, title: "foo")
    issue = FactoryBot.build(:issue, title: "foo")
    expect(issue).not_to be_valid
  end
  it "does not allow duplicate issue numbers" do
    FactoryBot.create(:issue, issue_number: "11")
    issue = FactoryBot.build(:issue, issue_number: "11")
    expect(issue).not_to be_valid
  end
  it "is invalid without a position" do
    issue = FactoryBot.build(:issue, position: nil)
    expect(issue).not_to be_valid
  end
end
