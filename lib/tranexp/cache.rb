module Tranexp
  class Cache

    def translate(text, from, to="eng")
      nil
    end

    protected
    def home_path
      @home_path ||= ENV["HOME"] || ENV["HOMEPATH"] || File::expand_path("~")
    end

    def cache_path
      File.join(home_path, '.tranexp')
    end

    # Destroys any existing cache and starts from scratch
    def create_cache
      FileUtils.rmdir cache_path rescue nil
      FileUtils.mkdir_p cache_path
    end
  end
end
