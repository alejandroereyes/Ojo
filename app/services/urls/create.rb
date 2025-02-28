module Urls
  class Create

    attr_reader :url

    def initialize(url)
      @url = url
    end

    def self.call(url)
      new(url).call
    end


    def call
      next_i = Url.count + 1 # TODO: use redis's INCR instead of url count

      url.short_url = ::Urls::Encode.bijective_encode(next_i)
      url.save!
      url
    end
  end
end