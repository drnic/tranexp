require File.dirname(__FILE__) + '/test_helper.rb'

class TestTranexpHttp < Test::Unit::TestCase

  def setup
    translate = Transexp::Http.new
  end
  
  def test_english_to_norwegian
    if_connected do
      assert_nothing_thrown do
        english = translate.from_norwegian_to_english("metoder")
        assert_equal("methods", english)
      end
    end
  end
end
