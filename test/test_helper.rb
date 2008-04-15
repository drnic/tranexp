require 'test/unit'
require File.dirname(__FILE__) + '/../lib/tranexp'

class Test::Unit::TestCase

  def if_connected(&block)
    unless ENV['NO_CONNECTION']
      yield
    end
  end

end
