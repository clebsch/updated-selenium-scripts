require "selenium"
require "test/unit"

class PrivacyLink < Test::Unit::TestCase
  def setup
    base_url = "http://wwwtst.containerstore.com"
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", base_url, 10000);
      @selenium.start
    end
    @selenium.set_context("test_privacy_link")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_privacy_link
    @selenium.open "/welcome.htm"
    @selenium.click "link=Privacy"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Acceptance of Terms"
    assert !10.times{ break if (@selenium.is_text_present("Acceptance of Terms") rescue false); sleep 1 }
    @selenium.click "link=Collecting Personal Information"
    assert !10.times{ break if (@selenium.is_text_present("Collecting Personal Information") rescue false); sleep 1 }
    @selenium.click "link=Browsing Our Site"
    assert !10.times{ break if (@selenium.is_text_present("Browsing Our Site") rescue false); sleep 1 }
    @selenium.click "link=How We May Use Your Information"
    assert !10.times{ break if (@selenium.is_text_present("How We May Use Your Information") rescue false); sleep 1 }
    
    @selenium.click "link=Sharing Your Information and Third-party Partnerships"
    assert !10.times{ break if (@selenium.is_text_present("Sharing Your Information and Third-party Partnerships") rescue false); sleep 1 }
    @selenium.click "link=Disclosure of Your Personal Information"
    assert !10.times{ break if (@selenium.is_text_present("Disclosure of Your Personal Information") rescue false); sleep 1 }
    @selenium.click "link=Security of Our Site"
    assert !10.times{ break if (@selenium.is_text_present("Security of Our Site") rescue false); sleep 1 }
    @selenium.click "link=Reviewing and Revising Your Account Information"
    assert !10.times{ break if (@selenium.is_text_present("Reviewing and Revising Your Account Information") rescue false); sleep 1 }
    
    @selenium.click "link=Opting Out"
    assert !10.times{ break if (@selenium.is_text_present("Opting Out") rescue false); sleep 1 }
    @selenium.click "link=Children and Privacy"
    assert !10.times{ break if (@selenium.is_text_present("Children and Privacy") rescue false); sleep 1 }
    @selenium.click "link=Information Provided When You Apply for a Job Online"
    assert !10.times{ break if (@selenium.is_text_present("Information Provided When You Apply for a Job Online") rescue false); sleep 1 }
    @selenium.click "link=Questions"
    assert !10.times{ break if (@selenium.is_text_present("Questions") rescue false); sleep 1 }
  end
  
  def close_b
    @selenium.click "link.logout"
    @selenium.wait_for_page_to_load "30000"
  end

end
