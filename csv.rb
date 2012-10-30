require 'csv'
sum=0.0

CSV.foreach("thing.csv") do |row|
	temp=row[0].to_f
	if temp>5.0	
			sum=temp+sum	
	end
end
CSV.open("exam.csv", 'w') do |writer|
	writer <<[sum]
end
CSV.foreach("exam.csv") do |row|
	print row
end
