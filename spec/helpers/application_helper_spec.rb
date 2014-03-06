require 'spec_helper'


describe ApplicationHelper do
  describe "#nav_link" do
    it "includes the active class when on the current page" do
      allow(self).to receive(:current_page?).and_return(true)
      nav_link('foo','bar').should match '<li class="active"><a href="bar">foo</a></li>'
    end
    it "excludes the active class when not on the current page" do
      allow(self).to receive(:current_page?).and_return(false)
      nav_link('foo','bar').should match '<li class=""><a href="bar">foo</a></li>'
    end
  end
end