# https://zmerrychristmas.github.io/posts/shortened-url-by-ruby-on-rails/

module Urls
  class Encode
    ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
    LENGTH = 7

    def self.bijective_encode(i)
      # from http://refactormycode.com/codes/125-base-62-encoding
      # with only minor modification
      return ALPHABET[0] if i == 0
      s = ''
      base = ALPHABET.length
      while i > 0
        s << ALPHABET[i.modulo(base)]
        i /= base
      end
      s.reverse[0...LENGTH]
    end

    def self.bijective_decode(s)
      # based on base2dec() in Tcl translation
      # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
      i = 0
      base = ALPHABET.length
      s.each_char { |c| i = i * base + ALPHABET.index(c) }
      i
    end
  end
end
