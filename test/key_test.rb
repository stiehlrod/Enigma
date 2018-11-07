require './test/test_helper'
require 'date'
require './lib/key'
require './lib/enigma'

class KeyTest < Minitest::Test

  def test_it_can_generate_random_key
    skip
    enigma = Enigma.new
    enigma.stub :get_random_key, "40895" do
      actual = enigma.get_random_key
      expected = "40895"
      assert_equal expected, actual
    end
  end

  def test_it_can_make_key_array
    enigma = Enigma.new
    expected = [02,27,71,15]
    actual = enigma.make_key_array("02715")
    assert_equal expected, actual
  end

end
