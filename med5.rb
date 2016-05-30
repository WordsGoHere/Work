1) munsters.each do |key, value|
age = 0
  if key.value_at('gender') == 'male'
	  age = age + key.values_at('age')
	end
	age
end

2) munsters.each do |key, value| 
gender = key.values_at('gender')
age = key.values_at('age')
puts "#{key} is a #{age} year old #{gender}"
end 

3) You can remove the modifers "my, a , an".  Change the names to
something more distinctive.

4)  sentence.split
		sentence.reverse
		sentence.join
		
5)  42

6)  When you add a new value to the hash it's a destructive action.
Even though .each is not the act of adding a new value is.

7) paper

8) 'no'

