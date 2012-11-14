class RPNCalculator
    def evaluate(expression)
        expression = expression.split
        operands = []
        evaluation = []

        expression.each do |x|
            case x
                when /\d/
                    evaluation.push(x.to_f)
                when "-", "/", "*", "+", "**"
                    operands = evaluation.pop(2)
                    evaluation.push(operands[0].send(x, operands[1]))
            end
        end
        puts evaluation
    end
end
class String
  def is_integer?
    self.to_f.to_s == self
  end
  def input
	str="fail"
	str1=str
	while((str[0].is_integer? != true) && (str[1].is_integer? != true))
		p "Enter expression to calculate"
		STDOUT.flush 
		str = gets.chomp
		str1=str
		str=str.split
	end
	return str1
  end
end
calc= RPNCalculator.new
s = String.new
check_again=false
while(check_again!=true)
	str = s.input
	calc.evaluate(str)
	p "Do you want to calculate  again"
	str_again="sadga"
	STDOUT.flush 
	str_again = gets.chomp
	str_again.split
	if(str_again=="no" || str_again=="nope" || str_again=="N" || str_again=="n" || str_again=="No" || str_again=="nah")
		check_again=true
	end	
end