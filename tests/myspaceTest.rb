require '../myspace'
require 'test/unit'

class MySpaceTest < Test::Unit::TestCase
  def test_initialize
    my = MySpace.new
    assert_not_nil(my)
  end
  
  def test_hpricot_present
    my = MySpace.new
    assert_not_nil(Hpricot)
  end
  
  def test_profile_load
    my = MySpace.new
    my.profile = "tommorris"
    my.load
    assert_not_nil(my.profile)
    assert_equal("tommorris", my.profile)
    assert_not_nil(my.hmodel)
  end
  
  def test_profile_tommorris
    my = MySpace.new
    my.profile = "tommorris"
    my.load
    assert_equal("Tom", my.name)
    assert_equal("http://www.myspace.com/tommorris", my.url)
    assert_equal("17", my.friends)
    assert_equal("Male", my.sex)
    assert_equal("23", my.age)
    assert_equal("United Kingdom", my.location)
    assert_equal("2007-09-13", my.lastlogin)
    assert_equal("Single", my.status)
    assert_equal("Atheist", my.religion)
    assert_equal("Aquarius", my.starsign)
    assert_equal("I don't want kids", my.children)
    assert_equal("In college", my.education)
    assert_equal(false, my.smoke)
    assert_equal(false, my.drink)
  end
  
  def test_profile_danbowring
    my = MySpace.new
    my.profile = "danbowring"
    my.load
    assert_equal("Dan", my.name)
    assert_equal("http://www.myspace.com/danbowring", my.url)
    assert_equal("22", my.friends)
    assert_equal("Male", my.sex)
    assert_equal("23", my.age)
    assert_equal("France", my.location)
    assert_equal("Tuzie", my.hometown)
    assert_equal("2007-12-25", my.lastlogin)
    assert_equal("Single", my.status)
    assert_equal("Taurus", my.starsign)
    assert_equal("Someday", my.children)
    assert_equal(false, my.smoke)
    assert_equal(true, my.drink)
  end
  
end