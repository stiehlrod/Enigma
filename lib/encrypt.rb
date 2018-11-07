require './lib/enigma'

class Encrypt < Enigma

  def initialize
  end

  def encrypt_translate(char, shift_amt)
    new_ind = character_map.index(char) + shift_amt
    character_map[new_ind % 27]
  end

  def prepare_for_encryption(message, key = get_random_key, date_string = today)
    shift = make_shift_hash(date_string, key)
    message.chars.map.with_index do |char, i|
      encrypt_translate(char, shift[i % 4])
    end.join
  end
end
