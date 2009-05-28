require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Feedzirra::Parser::ITunesRSS do
  describe "#will_parse?" do
    it "should return true for an itunes RSS feed" do
      Feedzirra::Parser::ITunesRSS.should be_able_to_parse(sample_itunes_feed)
    end

    it "should return fase for an atom feed" do
      Feedzirra::Parser::ITunesRSS.should_not be_able_to_parse(sample_atom_feed)
    end
  end

  describe "parsing" do
    before(:each) do
      @feed = Feedzirra::Parser::ITunesRSS.parse(sample_itunes_feed)
    end

    it "should parse the subtitle" do
      @feed.itunes_subtitle.should == "A show about everything"
    end

    it "should parse the author" do
      @feed.itunes_author.should == "John Doe"
    end

    it "should parse an owner" do
      @feed.itunes_owners.size.should == 1
    end

    it "should parse an image" do
      @feed.itunes_image.should == "http://example.com/podcasts/everything/AllAboutEverything.jpg"
    end

    it "should parse categories" do
      @feed.itunes_categories.size == 2
      # @feed.itunes_categories[0].name.should == "Technology"
      @feed.itunes_categories[0].should == "Technology"
      # @feed.itunes_categories[0].sub_categories.size.should == 1
      # @feed.itunes_categories[0].sub_categories[0].should == "Gadgets"
      # @feed.itunes_categories[1].name.should == "TV &amp; Film"
      @feed.itunes_categories[1].should == "Gadgets"
      @feed.itunes_categories[2].should == "TV &#38; Film"
      # @feed.itunes_categories[1].sub_categories.size.should == 0
    end

    it "should parse the summary" do
      @feed.itunes_summary.should == "All About Everything is a show about everything. Each week we dive into any subject known to man and talk about it as much as we can. Look for our Podcast in the iTunes Music Store"
    end

    it "should parse entries" do
      @feed.entries.size.should == 4
    end

    it "should assign an id even if no guid is present" do
      @feed.entries.last.id.should == 'http://58.159.184.66/9darts/ipod/dai_throw.mp4'
      @feed.entries.last.guid.should == 'http://58.159.184.66/9darts/ipod/dai_throw.mp4'
    end

    it "should not overwrite an existing id" do
      # @feed.entries[2].id.should == 'http://example.com/podcasts/archive/aae20050601.mp3'
      @feed.entries[2].guid.should == 'http://example.com/podcasts/archive/aae20050601.mp3'
    end
  end
end