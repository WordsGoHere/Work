one_to_nine = [*'1'..'9']
solutions = []
['+','-',''].repeated_permutation(8).to_a.each do |operations|
  string_equation = one_to_nine.zip(operations).join
  answer = eval string_equation
  solutions << string_equation if answer == 100
end

solutions.each do |solution|
  puts "#{solution} = 100"
end