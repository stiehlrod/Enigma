require 'date'
require './lib/key'
require './test/test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_keys_array_can_return_an_array
    skip
    actual = @enigma.get_keys_array(["1","2","3","4","5"])
    assert_equal [12,23,34,45], actual
  end

  def test_it_can_make_key_array
    skip
    expected = [02,27,71,15]
    actual = @enigma.make_key_array("02715")
    assert_equal expected, actual
  end

end
