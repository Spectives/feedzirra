require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Feedzirra::Parser::RSS do
  describe "#will_parse?" do
    it "should return true for an RSS feed" do
      Feedzirra::Parser::RSS.should be_able_to_parse(sample_rss_feed)
    end

    it "should return true for an rdf feed" do
      Feedzirra::Parser::RSS.should be_able_to_parse(sample_rdf_feed)
    end

    it "should return true for an iTunes feed" do
      Feedzirra::Parser::RSS.should be_able_to_parse(sample_itunes_feed)
    end

    it "should return fase for an atom feed" do
      Feedzirra::Parser::RSS.should_not be_able_to_parse(sample_atom_feed)
    end
  end

  describe "parsing" do
    before do
      @feed = Feedzirra::Parser::RSS.parse(sample_mrss_feed)
    end

    it "should parse the title" do
      @feed.title.should == "Google Video - Hot videos"
    end

    it "should parse the url" do
      @feed.url.should == "http://video.google.com/"
    end

    it "should provide an accessor for the feed_url" do
      @feed.respond_to?(:feed_url).should == true
      @feed.respond_to?(:feed_url=).should == true
    end

    it "should parse entries" do
      @feed.entries.size.should == 20
    end

    it "should parse the image" do
      pending 'setting NilClass for some reason'
      @feed.image.class.should == 'RSSImage'
      @feed.image.title.should == 'Google Video - Hot videos'
      @feed.image.link.should == 'http://video.google.com/'
      @feed.image.url.should == 'http://video.google.com/common/google_logo_small.jpg'
      @feed.image.width.should == '100'
      @feed.image.height.should == '37'
    end

    describe "parsing an iTunes feed" do
      before do
        @feed = Feedzirra::Parser::RSS.parse(sample_itunes_feed)
      end

      it "should parse an image" do
        @feed.image.should == "http://example.com/podcasts/everything/AllAboutEverything.jpg"
      end

      it "should parse categories" do
        @feed.categories.size == 2
        @feed.categories[0].should == "Technology"
        @feed.categories[1].should == "Gadgets"
        @feed.categories[2].should == "TV &#38; Film"

        # @feed.categories[0].name.should == "Technology"
        # @feed.categories[0].sub_categories.size.should == 1
        # @feed.categories[0].sub_categories[0].should == "Gadgets"
        # @feed.categories[1].name.should == "TV &amp; Film"
        # @feed.categories[1].sub_categories.size.should == 0
      end

      it "should parse the summary" do
        @feed.summary.should == "All About Everything is a show about everything. Each week we dive into any subject known to man and talk about it as much as we can. Look for our Podcast in the iTunes Music Store"
      end

      it "should parse entries" do
        @feed.entries.size.should == 4
      end

      it "should parse the owner name" do
        @feed.owner_name.should == 'John Doe'
      end

      it "should parse the owner email" do
        @feed.owner_email.should == 'john.doe@example.com'
      end
    end
  end
end