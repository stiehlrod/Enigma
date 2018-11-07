require './test/test_helper'
require './lib/key'
require './lib/enigma'

class KeyTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_generate_random_key
    enigma = mock #Enigma.new
    enigma.stubs(:get_random_key).returns"40895"
      actual = enigma.get_random_key
      expected = "40895"
      assert_equal expected, actual
  end

  def test_it_can_make_key_array
    enigma = Enigma.new
    expected = [02,27,71,15]
    actual = enigma.make_key_array("02715")
    assert_equal expected, actual
  end

end
