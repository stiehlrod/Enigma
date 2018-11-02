require 'pry'

class Enigma

  def initialize

  end

  def convert_date(date_string)
    date_string = "040895"
    date = date_string.to_i
    squared = date * date
    squared.to_s[-4..-1].to_i
  end

  def character_map
    character_map = ('a'...'aa').to_a
    character_map.push(" ")
  end
  def get_random_keys
    random = rand(11111...99999).to_s
    random.split(//)
  end

  def add_keys_together
    # random_array = get_random_keys
    random_array = ["1","2","3","4","5"]
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
  # def new
  #   binding.pry
  #   a1 = (random_array[0] + random_array[1]).to_i
  #   b1 = (random_array[1] + random_array[2]).to_i
  #   c1 = (random_array[2] + random_array[3]).to_i
  #   d1 = (random_array[3] + random_array[4]).to_i
  #   key = convert_date(date_string)
  #   a2 = key[0]
  #   b2 = key[1]
  #   c2 = key[2]
  #   d2 = key[3]
  #
  #   decode_a = a1 = a2
  #   decode_b = b1 = b2
  #   decode_c = c1 = c2
  #   decode_d = d1 = d2
  # end

  # def encrypt(message, key, date_string)
  # end
end
