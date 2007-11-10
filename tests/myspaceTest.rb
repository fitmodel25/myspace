require '../myspace'
require 'test/unit'

class MySpaceTest < Test::Unit::TestCase
  def test_initialize
    my = MySpace.new
    assert_not_nil(my)
  end
end