puts "Hello, world!"


def barBouncer(age)
	puts "You are #{age}. And you are"
	if age >= 18
		puts "an adult!"
	else
		puts "a baby!"
	end
end


age = 30
barBouncer(age)
 
age = 1

barBouncer(age)


(1..5).each do |i|
	puts "Number #{i}"
end
