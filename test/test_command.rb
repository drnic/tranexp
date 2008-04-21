require File.dirname(__FILE__) + '/test_helper.rb'
require "tranexp/command"

class TestCommand < Test::Unit::TestCase
  def test_run_simple
    Tranexp::Translate.any_instance.expects(:translate).with("metoder", "nor", "eng").returns("methods")
    english = Tranexp::Command.run("metoder", "nor", "eng")
    assert_equal("methods", english)
  end
end