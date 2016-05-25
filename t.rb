def prompt(message)
  puts "#{message}"
end


loop do

prompt"Stay or Hit?"
answer = gets.chomp
  if answer == "Stay" || Busted?(play_h)
    break
  elsif answer == "Hit" 
    deal(play_h)
  else
    prompt"Pick either Stay or Hit"
  end
end  