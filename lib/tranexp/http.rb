class Tranexp::Http
  include Tranexp::Codes
  PostURL = "http://www.tranexp.com:2000/Translate/result.shtml"

  def translate(text, from, to="eng")
    @agent ||=  WWW::Mechanize.new
    @agent.set_proxy("localhost", "8890") if ENV['CHARLES']
    page = @agent.post(PostURL)
    # charset=windows-1252
    page = @agent.post(PostURL, {
      :from => from,
      :to   => to,
      :text => prepare(text),
      :keyb => "non",
      "Submit.x" => 33,
      "Submit.y" => 9,
      :translation => ""
    })
    clean_up page.forms[1]['translation']
  end

  protected
  def prepare raw_text
    raw_text # how do we prepare unicode? ø -> %F8
  end

  def clean_up dirty_text
    newstr = ""
    dirty_text.each_byte do |character|
      newstr += if character < 0x80
        character.chr
      elsif character < 0xC0
        "\xC2" + character.chr
      else
        "\xC3" + (character - 64).chr
      end
    end
    newstr
  end
end

