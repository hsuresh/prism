require File.join('.', File.dirname(__FILE__), '..', 'test_helper.rb')

class HResumeTest < Test::Unit::TestCase
  describe 'HResume Parser' do
    def self.before_all
    end

    setup do
      @doc     ||= Nokogiri.HTML(get_fixture('hresume/Muhilan_Rajaram.html'))
      @hresume = Prism::Microformat::HResume.new(@doc)
    end

    should 'parse name' do
      assert_equal "Muhilan Rajaram", @hresume.name
    end
    should 'parse title' do
      assert_equal "Senior Consultant at ThoughtWorks", @hresume.current_title
    end
    should 'parse address' do
      assert_equal "Chennai Area, India", @hresume.demographic
    end
    should 'parse profile summary' do
      assert_equal                                                                                                                   "6+ years of Experience in Software Testing Specialties Black Box Testing ,"+
                                                                                                                                         " Automation testing using Silk Test,Selenium, QTP,Continuous Integration using Hudson,GO and Agile Testing", @hresume.profile_summary
    end

    should 'parse overview summary' do
      assert_equal ["Quality Analyst at  THOUGHTWORKS Technologies",
                    "Senior Consultant - QA at  ThoughtWorks",
                    "Test Lead - Automation at  Wipro Technologies",
                    "Senior Software Engineer at  Covansys India Pvt Ltd - eBay",
                    "Information Associate at  Electronic Data Systems Pvt Ltd",
                    "Programmer Analyst at  Cognizant Technology Solutions",
                    "Programmer Analyst at  Cognizant Technology Solutions"],
                   @hresume.overview_summary
    end


    should "parse experience" do
      assert_equal @hresume.positions.count, 7
      exp = @hresume.positions[0]
      assert_equal "Quality Analyst", exp.title
      assert_equal "THOUGHTWORKS Technologies", exp.org
      assert_equal "January 2010", exp.calendar['start']
      assert_equal "", exp.calendar['end']
      assert_equal "(1 year 3 months)", exp.calendar['duration']
      assert_equal "Present", exp.calendar['timestamp']
    end

    should "parse education" do
      assert_equal @hresume.education.count, 3
      edu = @hresume.education[0]
      assert_equal "Rajalakshmi College of Engineering", edu.institution
      assert_equal "B.Tech", edu.degree
      assert_equal "Information Technology", edu.major
      assert_equal "78%", edu.description
      assert_equal "1999", edu.calendar['start']
      assert_equal "2003", edu.calendar['end']
      assert_equal "", edu.calendar['duration']
      assert_equal "", edu.calendar['timestamp']
    end

  end
end
