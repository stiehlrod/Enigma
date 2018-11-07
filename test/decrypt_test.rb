require './lib/decrypt'
require './test/test_helper'

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new
    assert_instance_of Decrypt, decrypt
  end

  def test_it_can_prepare_for_decrpyt
    decrypt = Decrypt.new
    expected = 'hello world'
    actual = decrypt.prepare_for_decryption("keder ohulw", "02715", "040895")
    assert_equal expected, actual
  end

  def test_it_can_decrypt_a_string
    decrypt = Decrypt.new
    actual = decrypt.decrypt("keder ohulw", "02715", "040895")
    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
    assert_equal expected, actual
  end

  def test_it_can_decrypt_with_todays_date
    decrypt = Decrypt.new
    decrypt.stub :today, "040895" do
      actual = decrypt.decrypt("keder ohulw", "02715")
      expected = {
          decryption: "hello world",
          key: "02715",
          date: "040895"
        }
      assert_equal expected, actual
    end
  end

  def test_it_can_decrypt_use_random_key_and_todays_date
      decrypt = Decrypt.new
      decrypt.stubs(:get_random_key).returns"02715"
      decrypt.stubs(:today).returns"040895"
      actual = decrypt.decrypt("keder ohulw")
      expected = {
          decryption: "hello world",
          key: "02715",
          date: "040895"
        }
      assert_equal expected, actual
  end
end
