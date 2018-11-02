require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end
  def test_it_exists
    assert_instance_of Enigma, @enigma
    #=> #<Enigma:0x00007ff90f24cb78...>
  end

  def test_it_can_convert_a_date_string_to_key
    actual = @enigma.convert_date("040895")
    assert_equal 1025, actual
  end

  def test_character_map_can_return_an_array
    actual = @enigma.add_keys_together
    assert_equal [12,23,34,45], actual
  end
  # encrypt a message with a key and date
  def test_it_can_encrypt_a_message_with_key_and_date
    skip
  #=>
  #   {
  #     encryption: "keder ohulw",
  #     key: "02715",
  #     date: "040895"
  #   }

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
