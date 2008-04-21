require File.dirname(__FILE__) + '/test_helper.rb'

class TestCaching < Test::Unit::TestCase
  attr_reader :translate, :http, :cache

  def setup
    @translate = Tranexp::Translate.new
    @http      = @translate.http
    @cache     = @translate.cache

    @cache.stubs(:home_path).
      returns(File.dirname(__FILE__) + '/cache/')
  end

  def teardown
    FileUtils.rmdir File.dirname(__FILE__) + '/cache/' rescue nil
  end

  def test_cache_db_created
    http.expects(:translate).
      with("metoder", "nor", "eng").
      returns("methods").
      once
    do_translation
    assert File.directory?(File.dirname(__FILE__) + '/cache/.tranexp'),
          "HOME/.tranexp not created"
  end

  def test_requests_are_cached
    http.expects(:translate).
      with("metoder", "nor", "eng").
      returns("methods").
      once
    do_translation
    do_translation
    do_translation
  end

  def do_translation
    english = translate.translate("metoder", "nor", "eng")
    assert_equal("methods", english)
  end
end