require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Feedzirra::Parser::RSSEntry do
  before do
    # I don't really like doing it this way because these unit test should only rely on RSSEntry,
    # but this is actually how it should work. You would never just pass entry xml straight to the AtomEnry
    @entry = Feedzirra::Parser::RSS.parse(sample_rss_feed).entries.first
  end

  it "should parse the title" do
    @entry.title.should == "Nokogiri’s Slop Feature"
  end

  it "should parse the url" do
    @entry.url.should == "http://tenderlovemaking.com/2008/12/04/nokogiris-slop-feature/"
  end

  it "should parse the author" do
    @entry.author.should == "Aaron Patterson"
  end

  it "should parse the content" do
    @entry.content.should == sample_rss_entry_content
  end

  it "should provide a summary" do
    @entry.summary.should == "Oops!  When I released nokogiri version 1.0.7, I totally forgot to talk about Nokogiri::Slop() feature that was added.  Why is it called \"slop\"?  It lets you sloppily explore documents.  Basically, it decorates your document with method_missing() that allows you to search your document via method calls.\nGiven this document:\n\ndoc = Nokogiri::Slop&#40;&#60;&#60;-eohtml&#41;\n&#60;html&#62;\n&#160; &#60;body&#62;\n&#160; [...]"
  end

  it "should parse the published date" do
    @entry.published.to_s.should == "Thu Dec 04 17:17:49 UTC 2008"
  end

  it "should parse the categories" do
    @entry.categories.should == ['computadora', 'nokogiri', 'rails']
  end

  it "should parse the guid as id" do
    @entry.id.should == "http://tenderlovemaking.com/?p=198"
  end

  describe "parsing an iTunes feed" do
    before do
      @item = Feedzirra::Parser::RSS.parse(sample_itunes_feed).entries.first
    end

    it "should parse the title" do
      @item.title.should == "Shake Shake Shake Your Spices"
    end

    it "should parse the author" do
      @item.author.should == "John Doe"
    end

    it "should parse the subtitle" do
      @item.subtitle.should == "A short primer on table spices"
    end

    it "should parse the summary" do
      @item.summary.should == "This week we talk about salt and pepper shakers, comparing and contrasting pour rates, construction materials, and overall aesthetics. Come and join the party!"
    end

    it "should parse the enclosure" do
      @item.enclosure_length.should == "8727310"
      @item.enclosure_type.should == "audio/x-m4a"
      @item.enclosure_url.should == "http://example.com/podcasts/everything/AllAboutEverythingEpisode3.m4a"
    end

    it "should parse the id" do
      @item.id.should == "http://example.com/podcasts/archive/aae20050615.m4a"
    end

    it "should parse the published date" do
      @item.published.should == Time.parse('Wed Jun 15 19:00:00 UTC 2005')
    end

    it "should parse the duration" do
      @item.duration.should == "7:04"
    end

    it "should parse the keywords" do
      @item.keywords.should == "salt, pepper, shaker, exciting"
    end
  end

  describe "parsing Media RSS" do
    before do
      @item = Feedzirra::Parser::RSS.parse(sample_mrss_feed).entries.first
    end

    it "should parse media:rating" do
      @item.rating.should == 'adult'
      @item.rating_scheme.should == 'urn:simple'
    end

    it "should parse media:title" do
      @item.media_title.should == 'The Montauk Monster-Hells Visits New York!'
    end

    it "should parse media:description" do
      @item.media_description.should == 'The story began with a July 23 article in a local newspaper, The Independent. Jenna Hewitt, 26, of Montauk, and three friends said they found the ...'
    end

    it "should parse media:keywords" do
      @item.media_keywords.should == 'kitty, cat, big dog, yarn, fluffy'
    end

    it "should parse media:tumbnail" do
      @item.media_content.size.should == 1
      @item.media_description.should == 'The story began with a July 23 article in a local newspaper, The Independent. Jenna Hewitt, 26, of Montauk, and three friends said they found the ...'
      @item.media_thumbnail.should == 'http://3.gvt0.com/vi/Y3rNEu4A8WM/default.jpg'
      @item.media_thumbnail_width.should == '320'
      @item.media_thumbnail_height.should == '240'
    end

    it "should parse media:category" do
      @item.media_category.should == 'Arts/Movies/Titles/A/Ace_Ventura_Series/Ace_Ventura_-_Pet_Detective'
      @item.media_category_scheme.should == 'http://dmoz.org'
      @item.media_category_label.should == 'Ace Ventura - Pet Detective'
    end

    it "should parse media:hash" do
      @item.media_hash.should == 'dfdec888b72151965a34b4b59031290a'
      @item.media_hash_algo.should == 'md5'
    end

    it "should parse media:player" do
      @item.media_player_url.should == 'http://www.example.com/player?id=1111'
      @item.media_player_width.should == '400'
      @item.media_player_height.should == '200'
    end

    it "should parse media:credit" do
      @item.credits.size.should == 2
      @item.credits.first.role.should == 'producer'
      @item.credits.first.scheme.should == 'urn:ebu'
      pending 'not sure why the name isn\'t getting set'
      @item.credits.first.name.should == 'John Doe'
    end

    it "should parse media:copyright" do
      @item.copyright.should == '2009 Example Co.'
      @item.copyright_url.should == 'http://example.com/copyright.html'
    end

    it "should parse media:restriction" do
      pending 'need to figure out why this is getting String'
      @item.media_restriction.type.should == 'MRSSRestriction'
      @item.media_restriction.value.should == 'au us'
      @item.media_restriction.scope.should == 'country'
      @item.media_restriction.relationship.should == 'allow'
    end
  end
end