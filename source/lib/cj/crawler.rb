require 'open-uri'
module CJ
  class Crawler
    attr_accessor :key
    def initialize(key)
      self.key = key
    end

    def get(url)
      open(url,  "Authorization" => key )
    end
  end
end