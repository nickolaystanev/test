class String
  def is_integer?
    self.to_f.to_s == self
  end
  def input
	str="fail"
	str1=str
	while((str[0].is_integer? != true) && (str[1].is_integer? != true))
		p "vuvedi izraz"
		STDOUT.flush 
		str = gets.chomp
		str1=str
		str=str.split
	end
	return str1
  end
end

s=String.new
p "eljnjd".is_integer?
str1= "8.6          9 +".split
p str1[0].is_integer?
p str1[1].is_integer?
p str=s.input
p str3