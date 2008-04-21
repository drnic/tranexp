require File.dirname(__FILE__) + '/test_helper.rb'

class TestTranslate < Test::Unit::TestCase
  attr_reader :translate

  def setup
    @translate = Tranexp::Translate.new
  end

  # TODO - test_english_to_norwegian_method_missing
  def TODO_test_english_to_norwegian_method_missing
    if_connected do
      translate.expects(:translate).with("metoder", "nor", "eng").returns("methods")
      assert_nothing_thrown do
        english = translate.from_nor_to_eng("metoder")
        assert_equal("methods", english)
      end
    end
  end

end