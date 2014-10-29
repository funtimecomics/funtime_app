require 'spec_helper'


describe ApplicationHelper, :type => :helper do
  describe "#nav_link" do
    it "includes the active class when on the current page" do
      allow(self).to receive(:current_page?).and_return(true)
      nav_link = nav_link('foo','bar')
      expect(nav_link).to match '<li class="active"><a href="bar">foo</a></li>'
    end
    it "excludes the active class when not on the current page" do
      allow(self).to receive(:current_page?).and_return(false)
      nav_link = nav_link('foo','bar')
      expect(nav_link).to match '<li class=""><a href="bar">foo</a></li>'
    end
  end
end
