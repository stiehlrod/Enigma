require 'pry'

class Enigma

  def initialize

  end

  def convert_date(date_string)
    # date_string = "040895"
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

  def get_random_key

    random = rand(11111...99999).to_s
    random.split(//)
  end

  def get_keys_array(random_array)
    # random_array = ["1","2","3","4","5"] #testing

    new_array = []
    random_array.each_cons(2) do |con|
      new_array << con
    end
    keys = new_array.map do |first, second|
      first+second
    end
    keys.map do |num|
        num.to_i
    end
  end

  # def make_a_hash_of_keys(array)
  #   array = get_keys_array(array)
  #   key_codes = {
  #     "A": 0,
  #     "B": 0,
  #     "C": 0,
  #     "D": 0
  #   }
  #   key_codes.each_with_index do |(key, value), i|
  #     key_codes[key] = array[i]
  #   end
  # end


  # def combine_keys_and_offsets(date_string, key = get_random_key)
  #   hash_of_keys = make_a_hash_of_keys(key)
  #   offsets = get_the_offsets(date_string) #[1,0,2,5]
  #   hash_of_keys.each_with_index do |(key,value),i|
  #     hash_of_keys[key] = value + offsets[i]
  #   end
  # end

  def make_date_array(date_string)
    #input ("040895")
    #return [1,0,2,5]
    date = date_string.to_i
    squared = date * date
    date_digits = squared.to_s[-4..-1]
    date_digits.split(//).to_a
    keys = convert_date(date_string)
    keys.map do |key|
      key.to_i
    end
  end

  def make_key_array(key)
    key_ints = key.chars.map.with_index do |char, i|
      key[i..i+1].to_i
    end
    key_ints.pop
    key_ints
  end

  def make_shift_hash(date_string, key)
    date_ints = make_date_array(date_string)
    key_ints = make_key_array(key)
    shift = {}
    date_ints.each_with_index do |int, index|
      shift[index] = int + key_ints[index]
    end
    shift
  end

  def translate(char, shift_amt)#h,0
    #find the letter int he aplha and rotate on the shift
    new_ind = character_map.index(char) + shift_amt
    character_map[new_ind]
      # binding.pry
  end

  def prepare_for_encryption(message, key, date_string)
    shift = make_shift_hash(date_string, key)
    # binding.pry
    message.chars.map.with_index do |char, i|
      translate(char, shift[i % 4])
    end.join

  end

#If we are trying to encrypt “hello world”, the first character
#(“h”) is shifted by the A shift (3). So “h” becomes “k”.
  def encrypt(message, key, date_string)
    # binding.pry
    message = prepare_for_encryption(message, key, date_string)
    return_hash = {}
    return_hash[:encryption] = message
    return_hash[:key] = key
    return_hash[:date] = date_string
    return_hash
  end

end

# binding.pry
# shifts = combine_keys_and_offsets(date_string)
# character_map
# input = message.split(//)
# input.each do |char|
#   shifts.each do |key, shift|
#     a = character_map.index(char)
#       b = character_map.rotate(shift)
#   end
# end
