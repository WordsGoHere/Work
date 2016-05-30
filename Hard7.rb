1)  Nothing

2)  a : 'hi'

3)  A. one	B. two	C. two
			 two		 three	 three
			 three	 one		 one

4) string = ''	
def UUID
  32.times do
		string = string + rand(9).to_s
	end
string = string.insert(8, '-')
string = string.insert(13, '-')
string = string.insert(18, '-')
string = string.insert(23, '-')
puts string
end


5)  def dot_separated_ip_address?(input_string)
			dot_separated_words = input_string.split(".")
			if dot_separated_words.count == 4 
				while dot_separated_words.size > 0 do
				  word = dot_separated_words.pop
				  break if !is_a_number?(word)
				end
			else
			  return false
		  end
			return true
end
		
		