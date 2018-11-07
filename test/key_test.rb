require './test/test_helper'
require 'date'
require './lib/key'
require './lib/enigma'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_can_generate_random_key
    skip
    enigma = Enigma.new
    enigma.stub :get_random_key, "40895" do
      actual = enigma.get_random_key
      expected = "40895"
      assert_equal expected, actual
    end
  end

  # def test_keys_array_can_return_an_array
  #   skip
  #   actual = @enigma.get_keys_array(["1","2","3","4","5"])
  #   assert_equal [12,23,34,45], actual
  # end
  #
  # def test_it_can_make_key_array
  #   skip
  #   expected = [02,27,71,15]
  #   actual = @enigma.make_key_array("02715")
  #   assert_equal expected, actual
  # end

end
