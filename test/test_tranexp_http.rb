require File.dirname(__FILE__) + '/test_helper.rb'

class TestTranexpHttp < Test::Unit::TestCase
  attr_reader :translate
  
  def setup
    @translate = Tranexp::Http.new
  end
  
  def test_english_to_norwegian
    if_connected do
      assert_nothing_thrown do
        english = translate.translate("metoder", Tranexp::Http::Norwegian, Tranexp::Http::English)
        assert_equal("methods", english)
      end
    end
  end
  
  def test_utf8
    if_connected do
      assert_nothing_thrown do
        english = translate.translate("i would like to learn Norwegian", Tranexp::Http::English, Tranexp::Http::Norwegian)
        require 'iconv'
        # actual = Iconv.new('utf-16', 'utf-8').iconv(english)
        assert_equal("jeg ville like å høre Norsk.", english)
      end
    end
  end

  def test_english_to_norwegian_method_missing
    translate.expects(:translate).with("metoder", "nor", "eng").returns("methods")
    if_connected do
      assert_nothing_thrown do
        english = translate.from_nor_to_eng("metoder")
        assert_equal("methods", english)
      end
    end
  end

end
