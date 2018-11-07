require 'pry'
require './lib/key'

class Enigma
include Key
  attr_reader :today

  def initialize

  end

  def today
    Date.today.strftime("%m%d%y")
  end

  # def get_key
  #   random_key.get_random_key
  # end

  def convert_date(date_string)
    date = date_string.to_i
    squared = date * date
    date_digits = squared.to_s[-4..-1]
    date_digits.split(//).to_a
  end

  def get_the_offsets(date_string)
    keys = convert_date(date_string)
    keys.map do |key|
      key.to_i
    end
  end

  def character_map
    character_map = ('a'...'aa').to_a
    character_map.push(" ")
  end

  def make_date_array(date_string)
    date = date_string.to_i
    squared = date * date
    date_digits = squared.to_s[-4..-1]
    date_digits.split(//).to_a
    keys = convert_date(date_string)
    keys.map do |key|
      key.to_i
    end
  end

    def make_key_array(key = get_random_key)
      key_ints = key.chars.map.with_index do |char, i|
        key[i..i+1].to_i
      end
      key_ints.pop
      key_ints
    end

  def make_shift_hash(date_string, key = get_random_key)
    date_ints = make_date_array(date_string)
    key_ints = make_key_array(key)
    shift = {}
    date_ints.each_with_index do |int, index|
      shift[index] = int + key_ints[index]
    end
    shift
  end

  def encrypt_translate(char, shift_amt)
    new_ind = character_map.index(char) + shift_amt
    character_map[new_ind % 27]
  end

  def decrypt_translate(char, shift_amt)
    new_ind = character_map.index(char) - shift_amt
    character_map[new_ind % 27]
  end

  def prepare_for_encryption(message, key = get_random_key, date_string = today)
    shift = make_shift_hash(date_string, key)
    message.chars.map.with_index do |char, i|
      encrypt_translate(char, shift[i % 4])
    end.join
  end

  def encrypt(message, key = get_random_key, date_string = today)
    message = prepare_for_encryption(message, key, date_string)
    return_hash = {}
    return_hash[:encryption] = message
    return_hash[:key] = key
    return_hash[:date] = date_string
    return_hash
  end

  def prepare_for_decryption(message, key, date_string = today)
    shift = make_shift_hash(date_string, key)
    message.chars.map.with_index do |char, i|
      decrypt_translate(char, shift[i % 4])
    end.join
  end

  def decrypt(message, key, date_string = today)
    # key = @key.get_random_key if key == nil
    message = prepare_for_decryption(message, key, date_string)
    return_hash = {}
    return_hash[:decryption] = message
    return_hash[:key] = key
    return_hash[:date] = date_string
    return_hash
  end
end
