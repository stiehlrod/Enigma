require './lib/enigma'

class Decrypt < Enigma

  def initialize
  end

  def decrypt_translate(char, shift_amt)
    new_ind = character_map.index(char) - shift_amt
    character_map[new_ind % 27]
  end

  def prepare_for_decryption(message, key, date_string = today)
    shift = make_shift_hash(date_string, key)
    message.chars.map.with_index do |char, i|
      decrypt_translate(char, shift[i % 4])
    end.join
  end
end
