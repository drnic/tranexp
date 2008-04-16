module Tranexp::Codes
  @@codes = {
    "BrazilianPortuguese" => "pob",
    "Bulgarian" => "bul",
    "Croatian" => "cro",
    "Czech" => "che",
    "Danish" => "dan",
    "English" => "eng",
    "Norwegian" => "nor"
  }
  @@codes.each_pair { |name, code| self.const_set(name, code) }
end

# remaining codes
# <option value="dut">Dutch</option><option value="spa">Spanish</option><option value="fin">Finnish</option><option value="fre">French</option><option value="ger">German</option><option value="grk">Greek</option><option value="hun">Hungarian (CP 1250)</option><option value="ice">Icelandic</option><option value="ita">Italian</option><option value="jpn">Japanese (Shift JIS)</option><option value="spl">Latin American Spanish</option><option value="nor">Norwegian</option><option value="tag">Filipino (Tagalog)</option><option value="pol">Polish (ISO 8859-2)</option><option value="poe">Portuguese</option><option value="rom">Romanian (CP 1250)</option><option value="rus">Russian (CP 1251)</option><option value="sel">Serbian (CP 1250)</option><option value="slo">Slovenian (CP 1250)</option><option value="swe">Swedish</option><option value="wel">Welsh</option><option value="tur">Turkish (CP 1254)</option><option value="ltt">Latin</option>
