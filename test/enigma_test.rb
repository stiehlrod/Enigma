require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_convert_a_date_string_to_key
    actual = @enigma.convert_date("040895")
    assert_equal ["1", "0", "2", "5"], actual
  end

  def test_it_can_make_date_array
    expected = [1,0,2,5]
    actual = @enigma.make_date_array("040895")
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
    expected = 'keder ohulw'
    actual = @enigma.prepare_for_encryption("hello world", "02715", "040895")
    assert_equal expected, actual
  end

  def test_it_can_encrypt_a_message_with_key_and_date
    actual = @enigma.encrypt("hello world", "02715", "040895")
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, actual
  end

  def test_it_can_decrypt_a_string
    actual = @enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, actual
  end

  def test_it_can_encrypt_with_todays_date
    enigma = Enigma.new
    enigma.stub :today, "040895" do
      actual = enigma.encrypt("hello world", "02715")
      expected = {
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
        }

      assert_equal expected, actual
    end
  end

  def test_it_can_decrypt_with_todays_date
    enigma = Enigma.new
    enigma.stub :today, "040895" do
      actual = enigma.decrypt("keder ohulw", "02715")
      expected = {
          decryption: "hello world",
          key: "02715",
          date: "040895"
        }

      assert_equal expected, actual
    end
  end

  def test_it_can_decrypt_use_random_key_and_todays_date
    enigma = Enigma.new
    enigma.stub :today, "040895" do
      actual = enigma.decrypt("keder ohulw")
      expected = {
          decryption: "hello world",
          key: "02715",
          date: "040895"
        }

      assert_equal expected, actual
    end
  end

end
