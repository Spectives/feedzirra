require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Feedzirra::Parser::RSSEntry::MRSSContent do
  before(:each) do
    # I don't really like doing it this way because these unit test should only rely on RSSEntry,
    # but this is actually how it should work. You would never just pass entry xml straight to the AtomEnry
    @entries = Feedzirra::Parser::RSS.parse(sample_mrss_feed).entries
  end

  it "should parse the media" do
    entry = @entries.first
    entry.media_content.size.should == 1
    entry.media_description.should == 'The story began with a July 23 article in a local newspaper, The Independent. Jenna Hewitt, 26, of Montauk, and three friends said they found the ...'
    entry.media_thumbnail.should == 'http://3.gvt0.com/vi/Y3rNEu4A8WM/default.jpg'
    entry.media_thumbnail_width.should == '320'
    entry.media_thumbnail_height.should == '240'
  end

  it "should handle multiple pieces of content" do
    media = @entries[1].media_content
    media.size.should == 2
    media[0].url.should == 'http://www.youtube.com/v/pvaM6sjLbuA&#38;fs=1'
    media[0].content_type.should == 'application/x-shockwave-flash'
    media[0].medium.should == 'video'
    media[0].duration.should == '575'

    media[1].url.should == 'http://www.youtube.com/v/pvaM6sjLbuA&#38;fs=2'
    media[1].content_type.should == 'video/mp4'
    media[1].medium.should == 'video'
    media[1].duration.should == '576'
  end
end
