module Tranexp
  class Translate
    attr_reader :http, :cache

    def initialize
      @http = Http.new
      @cache = Cache.new
    end

    def translate(text, from, to="eng")
      cache.translate(text, from, to) ||
      http.translate(text, from, to)
    end
  end

  # Support calls like #from_nor_to_eng, or #from_eng_to_
  def method_missing(meth, *args, &blk)
    if meth.to_s =~ /^from_([a-z]+)_to_([a-z]+)$/
      from, to = $1, $2
      return translate(args.first, from, to)
    end
    super
  end

end
