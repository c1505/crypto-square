require 'pry'
class Crypto
  attr_accessor :normalize_plaintext
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.gsub(/\W+/, '')
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
    siz = size - 2
    arr = []
    str = ciphertext
    until str == ""
      arr << str.slice!(0..siz)
    end
    arr.join(" ")
  end

end

