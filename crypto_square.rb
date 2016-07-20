require 'pry'
class Crypto
  attr_accessor :normalize_plaintext
  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    @string.downcase.gsub(/\W+/, '')
  end

  def size
    result = Math.sqrt(normalize_plaintext.length)
    if result % 1 != 0
      result.floor + 1
    else
      result
    end
  end

  def plaintext_segments
    # binding.pry
    siz = size - 1
    arr = []
    str = normalize_plaintext
    until str == ""
      arr << str.slice!(0..siz)
    end
    arr
  end

  def ciphertext
    arr = []
    segs = plaintext_segments
    (segs.length + 1).times do
      segs.each do |f|
        arr << f.slice!(0)
      end
    end
    arr.delete_if{|x| x == nil}.join
  end

  def normalize_ciphertext
    # str = self
    # var = Crypto.new(str)
    # var.ciphertext
    siz = size - 2

    arr = []
    str = ciphertext
    until str == ""
      arr << str.slice!(0..siz)
    end
    arr.join
  end

end

# The plaintext should be organized in to a rectangle.  The size of the
# rectangle (`r x c`) should be decided by the length of the message,
# such that `c >= r` and `c - r <= 1`, where `c` is the number of columns
# and `r` is the number of rows.

# Our normalized text is 54 characters long, dictating a rectangle with
# `c = 8` and `r = 7`:

# ```plain
# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# # sroots

# '1234
# 56789'