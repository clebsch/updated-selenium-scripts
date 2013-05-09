require "selenium"
require "test/unit"

class AddProductToCartWithGiftWrap < Test::Unit::TestCase
  def setup
    base_url = "http://wwwtst.containerstore.com"
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", base_url, 10000);
      @selenium.start
    end
    @selenium.set_context("test_add_product_to_cart_with_gift_wrap")
  end
  
  def teardown
    @selenium.stop unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_add_product_to_cart_with_gift_wrap
    @selenium.open "/welcome.htm"
    @selenium.click "link.login"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "j_username", "cc@yahoo.org"
    @selenium.type "j_password", "cane"
    @selenium.click "//input[@id='submit' and @name='submit']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Gift Packaging"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='Gift Wrap']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='Juvenile']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='Crabby & Crew Gift Wrap']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "addToCartButton"
    assert !10.times{ break if (@selenium.is_element_present("link=+ Continue Shopping") rescue false); sleep 1 }
    @selenium.click "link=+ Continue Shopping"
    @selenium.click "link=Shop Now"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Travel"
    @selenium.click "//img[@alt='Travel']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='Trunks']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='Rolling Gear Bag']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "addToCartButton"
    assert !10.times{ break if (@selenium.is_element_present("link=Checkout Now") rescue false); sleep 1 }
    @selenium.click "link=Checkout Now"
    @selenium.wait_for_page_to_load "30000"
   
    @selenium.click "beginCheckout"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//input[@value='Ship to this Address']"
    @selenium.wait_for_page_to_load "30000"
    
    #@selenium.click "link=Select and Continue"
    #@selenium.wait_for_page_to_load "30000"
    #@selenium.click "//input[@value='Continue']"
        
    @selenium.select "rows[0].customerPhone.id", "label=(214) 987-9874"
    @selenium.click "//input[@value='Continue']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.select "creditCardType", "label=MasterCard"
    @selenium.type "creditCardNumber", "5454545454545454"
    @selenium.select "expirationMonthString", "label=12"
    @selenium.select "expirationYear", "label=2015"
    @selenium.type "cvvCodeNewCard", "123"
    @selenium.click "//input[@value='Place Your Order']"
    @selenium.wait_for_page_to_load "30000"
    assert !10.times{ break if (@selenium.is_text_present("Thank you for shopping with The Container Store!") rescue false); sleep 1 }
    @selenium.click "link.logout"
    @selenium.wait_for_page_to_load "30000"
  end
end