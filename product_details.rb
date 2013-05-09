require "selenium"
require "test/unit"

class View_Product_Details < Test::Unit::TestCase
#  VIEW_PRODUCT_DETAILS = view_product_details
  def setup
    base_url = "http://wwwtst.containerstore.com"
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", base_url, 10000);
      @selenium.start
    end
    @selenium.set_context("test_view_product_details")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_view_product_details
#   @selenium.set_timeout ""
    @selenium.open "/welcome.htm"
    @selenium.click "link=Home"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Kitchen"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Food-on-the-Go"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Beverage Containers"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("Twist-n-Sip Bottles")
    @selenium.click "link=Home"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Kitchen"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Refrigerator & Freezer"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Covered Ice Cube Tray"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("The lid on our 21-Cube Ice Tray")
    @selenium.click "link=Home"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Kitchen"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Refrigerator & Freezer"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Beverage Can Dispenser"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Refrigerator & Freezer"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Beverage Can Dispenser"
    @selenium.wait_for_page_to_load "30000"
    assert !10.times{ break if (@selenium.is_text_present("We've designed our roomy Can Dispenser to hold an entire 12-pack of drinks") rescue false); sleep 1 }
  end
end