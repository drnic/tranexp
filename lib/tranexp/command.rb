require 'optparse'
class Tranexp::Command
  def self.run(text, from, to="eng")
    translate = Tranexp::Translate.new
    translate.translate(text, from, to)
  end
end
