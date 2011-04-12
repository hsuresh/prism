require File.join('.', File.dirname(__FILE__), '..', 'test_helper.rb')

class HResumeTest < Test::Unit::TestCase
  describe 'HResume Parser' do
    def self.before_all
    end
    
    setup do
      @doc ||= Nokogiri.parse(get_fixture('hresume/swati_saini.html'))
      @hresume = Prism::Microformat::HResume.parse(@doc)
    end
    

    should 'parse summary' do
      assert_false (@hresume.summary =~ /Marketing Executive\(Exports\)/).nil?, "Summary doesn't match"
    end

    should "parse experience" do
      assert_equal @hresume.positions.count, 1
      exp = @hresume.positions[0]
      assert_equal Time.parse('2010-01-01'), exp.vevent[:dtstart]
      assert_equal "Executive-Exports", exp.title
      assert exp.org.include?("Cords Cable Industries")
      assert_equal Time.parse('2010-01-01'), exp.vevent[:dtstart]
    end

  end  
end
