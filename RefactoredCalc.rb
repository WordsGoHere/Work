# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
CHOICES = %w(1 2 3 4)
 
LANG = set_language
def operation_to_message(op)
  case  op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def messages(message, lang= :en)
  MESSAGES[lang][message]
end

def valid_number?(number)
  number.to_i != 0
end

def number?(num)
  if num.is_a?(integer)
    prompt(:good)
  elsif num.is_a?(float)
    prompt(:good)
  else
    prompt(:new_number)
  end
end

def get_first_number
number1 = ""
loop do
  prompt (:first_number)
  number1 = gets.chomp
  if valid_number?(number1) 
    prompt (:number1)
    break
  else
    prompt (:new_number)
  end
end
number1
end

def get_second_number
number2 = ""
loop do
  prompt (:second_number)
  number2 = gets.chomp
  if valid_number?(number2) 
    prompt (:number2)
    break
  else
    prompt (:new_number)
  end
end
number2
end

def get_name
name = ""
loop do
  name = gets.chomp
  if name.empty?
    prompt (:valid_name)
  else
    break
  end
end
name
end

def get_function
function = ""
loop do
  function = gets.chomp
  if CHOICES
    break
  else
    prompt (:new_number)
  end
end
function
end

def set_language
language = ''
loop do
prompt (:language)
  language = gets.chomp
  break if language == 'en'
  break if language == 'fr'
  if language != 'en' || language != 'fr'
    prompt (:unknown)
  end
end
language.to_sym
end
 
prompt (:welcome)

name = get_name

loop do

  number1 = get_first_number

  number2 = get_second_number

  function_prompt = <<-QQQ
  What would you like to do?
  1) add
  2) subtract
  3) multiply
  4) divide
   QQQ

  prompt(function_prompt)

  function = get_function

  prompt("#{operation_to_message(function)} now ...")
  
  sleep 1
  
  result = ''
  case function
  when '1'
    result = number1.to_i + number2.to_i
  when '2'
    result = number1.to_i - number2.to_i
  when '3'
    result = number1.to_i * number2.to_i
  when '4'
    result = number1.to_f / number2.to_f
  end

prompt (:result)
puts result
prompt MESSAGES[:new_calc]
answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt (:thank_you)
