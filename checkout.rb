require "selenium"
require "test/unit"

class CheckoutAnonymous < Test::Unit::TestCase
  def setup
    base_url = "http://wwwtst.containerstore.com"
    @verification_errors = []
    if $selenium
      @selenium = $selenium
    else
      @selenium = Selenium::SeleniumDriver.new("localhost", 4444, "*chrome", base_url, 10000);
      @selenium.start
    end
    @selenium.set_context("test_checkout_anonymous")
  end
  
  #def teardown
  #  @selenium.stop unless $selenium
  #  assert_equal [], @verification_errors
  #end
   
  def test_checkout_anonymous
    @selenium.open "/welcome.htm"
  # @selenium.click "link=Home"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "Ntt", "shoe"
    @selenium.click "//input[@value='GO']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='Shelf']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//img[@alt='6-Section Shoe & Handbag Organizer']"
    @selenium.wait_for_page_to_load "30000"
    #@selenium.type "rows0.quantity", "2"
    #@selenium.type "rows1.quantity", "2"
    @selenium.click "addToCartButton"
   # @selenium.click "//div[1]"
   # @selenium.click "//img[contains(@src,'/images/navigation/header/cart.gif')]"
   # @selenium.wait_for_page_to_load "30000"
    
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
   # @selenium.wait_for_page_to_load "30000"
   
    @selenium.click "beginCheckout"
   # @selenium.wait_for_page_to_load "30000"
    
    @selenium.click "link=Checkout"
    @selenium.click "link=Checkout Now"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//input[@id='submit' and @name='submit' and @value='Checkout as Guest']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "address.firstName", "nas"
    @selenium.type "address.lastName", "tar"
    @selenium.type "address.addressLine1", "1771 pratt st"
    @selenium.type "address.city", "dallas"
    @selenium.select "states", "label=Texas"
    @selenium.type "address.postalCode", "75224"
    @selenium.click "//form[@id='customerAddress']/div/table/tbody/tr/td[2]/input"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "//input[@name='rows[0].method' and @value='expedited']"
    @selenium.type "rows0.customerPhone.phone.phoneNumber", "2149917647"
    @selenium.click "//input[@value='Continue']"
    @selenium.wait_for_page_to_load "30000"
    @selenium.select "creditCardType", "label=MasterCard"
    @selenium.type "creditCardNumber", "5454545454545454"
    @selenium.select "expirationMonthString", "label=12"
    @selenium.select "expirationYear", "label=2010"
    @selenium.type "cvvCodeNewCard", "123"
    @selenium.type "emailAddress", "nimunoz@containerstore.com"
    @selenium.click "receiveEmail2"
    @selenium.click "isTermsAndConditionsAccepted1"
    @selenium.click "//input[@value='Place Your Order']"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("Your order number is")
  end
  puts "2 hello"
end