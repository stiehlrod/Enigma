module Key

  attr_reader :random_key

  def initialize
  end

  def get_random_key
    rand(11111...99999).to_s
  end

end
