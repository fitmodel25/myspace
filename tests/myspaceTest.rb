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
    assert_equal("tommorris", my.profile)
    my.load
    assert_not_nil(my.model)
  end
  
  def test_profile_name
    my = MySpace.new
    my.profile = "tommorris"
    my.load
    assert_equal("Tom", my.name)
  end
  
  def test_profile_friends
    my = MySpace.new
    my.profile = "tommorris"
    my.load
    assert_equal("17", my.friends)
  end
end