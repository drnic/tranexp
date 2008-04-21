module Tranexp
  class Cache

    def translate(text, from, to="eng")
      cache_file = load_language_cache(from, to)
      cache_file[text] if cache_file
    end

    # returns the translation
    def store(text, translation, from, to)
      cache_file = load_language_cache(from, to) || {}
      cache_file[text] = translation
      create_cache_path
      File.open( language_cache_file(from, to), 'w' ) do |out|
        YAML.dump( cache_file, out )
      end
      translation
    end

    def load_language_cache(from, to)
      YAML.load_file(language_cache_file(from, to)) rescue nil
    end

    protected
    def home_path
      @home_path ||= ENV["HOME"] || ENV["HOMEPATH"] || File::expand_path("~")
    end

    def cache_path
      File.join(home_path, '.tranexp')
    end

    def language_cache_file(from, to)
      File.join(cache_path, "#{from}-#{to}.yml")
    end

    def create_cache_path
      FileUtils.mkdir_p cache_path
    end
  end
end
