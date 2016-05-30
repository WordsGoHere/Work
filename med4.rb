1) result = ' '
   10.times do 
   result = result + " "

   puts "#{result} The Flintstones Rock!"
   end
	 
2) statement = "The Flintstones Rock"
   hash = {}
   statement.split('').each do |x|
	   if hash.has_key?(x)
		   hash[x] = 2
	   else
		   hash[x] = 1
	   end
   end

3) You're adding an integer and a string.  You could add the .to_s
	method to the result of 40 + 2 or you could
	

4) 1,3 and 1,2

5) def factors(number)
	if number > 0
		dividend = number	
		divisors = []
		begin
			divisors << number / dividend if number % dividend == 0
			dividend -= 1
		end until dividend == 0
		divisors
	else
		puts ("This is not a positive integer")
	end
end

To check if there is a remainder.
So the local variable can be scoped.

6)When using << with an array it adds each additional element as a
seperate entitiy.  The + method ammends the array to reflect each individual
object in the new element.  The difference being whether or not you would like
to incorporate the additional object or exclude it within the array.

7)  The limit variable is located outside of the method that it's being
called from.  You would move it below the def line and the code should
work.

8)  def titleize
			upcase
		end
		
9)munsters.each do |key, value|
  if key.values_at('age') < 18
		key['age_group'] = 'kid'
	elsif key.values_at('age') > 17 && key.values_at('age') < 65
		key['age_group'] = 'adult'
	else key.values_at('age') > 64
	  key['age_group'] = 'senior'
	end
end

puts munsters