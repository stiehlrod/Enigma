require 'date'
require './lib/decrypt'
require './test/test_helper'

class DecryptTest < Minitest::Test

  def test_it_exists
    decrypt = Decrypt.new
    assert_instance_of Decrypt, decrypt
  end

  def test_it_can_prepare_for_encrpyt
    decrypt = Decrypt.new
    expected = 'keder ohulw'
    actual = decrypt.prepare_for_encryption("hello world", "02715", "040895")
    assert_equal expected, actual
  end

end
