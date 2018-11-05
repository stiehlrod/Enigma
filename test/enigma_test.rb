require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    skip
    assert_instance_of Enigma, @enigma
    #=> #<Enigma:0x00007ff90f24cb78...>
  end

  def test_it_can_convert_a_date_string_to_key
    skip
    actual = @enigma.convert_date("040895")
    assert_equal ["1", "0", "2", "5"], actual
  end

  def test_keys_array_can_return_an_array
    skip
    actual = @enigma.get_keys_array(["1","2","3","4","5"])
    assert_equal [12,23,34,45], actual
  end

  # def test_it_can_make_a_hash_of_keys
  #   skip
  #   actual = @enigma.make_a_hash_of_keys
  #   expected = {
  #     "A": 12,
  #     "B": 23,
  #     "C": 34,
  #     "D": 45
  #   }
  #   assert_equal expected, actual
  # end

  # def test_it_can_get_offsets
  #   skip
  #   # @enigma.convert_date
  #   actual = @enigma.get_the_offsets("040895")
  #   assert_equal [1,0,2,5], actual
  # end

  # def test_it_can_combine_keys_and_offsets
  #   skip
  #   @enigma.convert_date("040895")
  #   @enigma.get_keys_array
  #   @enigma.get_the_offsets("040895")
  #   expected = {
  #     "A": 13,
  #     "B": 23,
  #     "C": 36,
  #     "D": 50
  #   }
  #   assert_equal expected, @enigma.combine_keys_and_offests("040895")
  # end

  def test_it_can_make_date_array
    skip
    expected = [1,0,2,5]
    actual = @enigma.make_date_array("040895")
    assert_equal expected, actual
  end

  def test_it_can_translate
    actual = @enigma.translate("hello world",3)
    expected = 'keder ohulw'
    assert_equal expected, actual
  end

  def test_it_can_make_key_array
    skip
    expected = [02,27,71,15]
    actual = @enigma.make_key_array("02715")
    assert_equal expected, actual
  end

  def test_it_can_make_a_hash
    actual = @enigma.make_shift_hash("040895", "02715")
    expected = {
                0 => 3,
                1 => 27,
                2 => 73,
                3 => 20
              }
    assert_equal expected, actual
  end

  def test_it_can_prepare_for_encrpyt
    expected = 'keder'
    actual = @enigma.prepare_for_encryption("hello", "02715", "040895")
    assert_equal expected, actual
  end

  # encrypt a message with a key and date
  def test_it_can_encrypt_a_message_with_key_and_date
    skip
    actual = @enigma.encrypt("hello world", "02715", "040895")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, actual
  # decrypt a message with a key and date
  end
  def test_it_is
    skip
    enigma.decrypt("keder ohulw", "02715", "040895")
  #=>
  #   {
  #     decryption: "hello world",
  #     key: "02715",
  #     date: "040895"
  #   }
  end
  # encrypt a message with a key (uses today's date)
  def test_it_is
    skip
    encrypted = enigma.encrypt("hello world", "02715")
  #=> # encryption hash here

  #decrypt a message with a key (uses today's date)
  end
  def test_it_is
    skip
    enigma.decrypt(encrypted, "02715")
  #=> # decryption hash here

  # encrypt a message (generates random key and uses today's date)
  end
  def test_it_is
    skip
    enigma.encrypt("hello world")
  #=> # encryption hash here
  end
end
