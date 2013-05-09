require "selenium"
require "test/unit"

class BlogLink < Test::Unit::TestCase
  def setup
    base_url = "http://wwwtst.containerstore.com"
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", base_url, 10000);
      @selenium.start
    end
    @selenium.set_context("test_blog_link")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_blog_link
    @selenium.open "/welcome.htm"
    @selenium.click "link=Our Blog"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Welcome"
    assert !10.times{ break if (@selenium.is_text_present("Kip Tindell") rescue false); sleep 1 }
  end
  
  def close_b
    @selenium.click "link.logout"
    @selenium.wait_for_page_to_load "30000"
  end
end
