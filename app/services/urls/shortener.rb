# https://zmerrychristmas.github.io/posts/shortened-url-by-ruby-on-rails/

module Urls
  class Shortener
    ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-.".split(//)
    LENGTH = 7

    def self.call(i)
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
  end
end
