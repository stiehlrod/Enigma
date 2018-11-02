require 'pry'

class Enigma

  def initialize

  end

  def convert_date(date_string)
    date = date_string.to_i
    squared = date * date
    squared.to_s[-4..-1].to_i
  end
  def encrypt(message, key, date_string)


  end
  # def character_map
  #   character_map = ('a'...'aa').to_a
  #   character_map.push(" ")
  #
  #   random = rand(11111...99999).to_s
  #   p random_array = random.split(//)
  #   a1 = (random_array[0] + random_array[1]).to_i
  #   b1 = (random_array[1] + random_array[2]).to_i
  #   c1 = (random_array[2] + random_array[3]).to_i
  #   d1 = (random_array[3] + random_array[4]).to_i
    # The offsets are found using the date of transmission.

    # Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995,
    #it would be represented as 040895.
    # Square the numeric form (1672401025)
    # Take the last four digits (1025)
    # A offset: The first digit (1)
    # B offset: The second digit (0)
    # C offset: The third digit (2)
    # D offset: The fourth digit (5)
  # end
end
