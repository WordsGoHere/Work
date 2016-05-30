1) ages.include?("Spot")
   ages.selece("Spot")
	 ages.find("Spot")
	 ages.scan("Spot")
	 
2)  ages.values{|value, result| result = value + result ; return result}

3)  ages.delete_if{|key, value| value > 100}

4)  munsters_description.downcase
    munster_description.swap!
		munster_description.downcase
		munster_description.upcase
		
5)  ages << "Marilyn" => 22
    ages << "Spot" => 237
		
6)	lowest_value = nil
    ages.each do |key, value|
			if value > lowest_value
				return
			else
				value = lowest_value
			end
			lowest_value
		end
		
7)  advice.select?("Dino")

8)  flintstones.find_index("Be")

9)  flintstones.map{|name| name[0..2]}

10) flintstones.map{|name| name[0..2]} 