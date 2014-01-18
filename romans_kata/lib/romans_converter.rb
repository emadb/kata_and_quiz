Fixnum.class_eval do
  def roman_map
    {M:1000,CM:900,D:500,CD:400,C:100,XC:90,L:50,XL:40,X:10, IX:9, V:5, IV:4, I:1}
  end
  
  def to_roman
    roman = ''
    number = self
    roman_map.each_key do |k|
      while number - roman_map[k] >= 0
        roman << k.to_s
        number -= roman_map[k]
      end
    end
    roman
  end
end