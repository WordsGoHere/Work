# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
CHOICES = %w(1 2 3 4).freeze

def set_language
  language = ''
  loop do
    p 'What language would would you like English: en or French:fr ?'
    language = gets.chomp
    break if language == 'en'
    break if language == 'fr'
    if language != 'en' || language != 'fr'
      p 'Sorry I don\'t know that language, Sorry je ne sais pas ce language'
    end
  end
  language.to_sym
end

LANGUAGE = set_language

def operation_to_message(op)
  if LANGUAGE == :en
    case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
    end
  else
    case op
    when '1'
      'Ajouter'
    when '2'
      'Soustraire'
    when '3'
      'Multiplier'
    when '4'
      'Fracture'
    end
  end
end

def prompt(message)
  puts "=> #{message}"
end

def messages(message)
  p "=> #{MESSAGES[LANGUAGE][message]}"
end

def valid_number?(number)
  number.to_i != 0
end

def number?(num)
  if num.is_a?(integer)
    messages(:good)
  elsif num.is_a?(float)
    messages(:good)
  else
    messages(:new_number)
  end
end

def first_number
  number1 = ''
  loop do
    messages(:first_number)
    number1 = gets.chomp
    if valid_number?(number1)
      messages(:number1)
      break
    else
      messages(:new_number)
    end
  end
  number1
end

def second_number
  number2 = ''
  loop do
    messages(:second_number)
    number2 = gets.chomp
    if valid_number?(number2)
      messages(:number2)
      break
    else
      messages(:new_number)
    end
  end
  number2
end

def names
  name = ''
  loop do
    name = gets.chomp
    if name.empty?
      messages(:valid_name)
    else
      break
    end
  end
  name
end

def functions
  function = ''
  loop do
    function = gets.chomp
    if CHOICES
      break
    else
      messages(:new_number)
    end
  end
  function
end

messages(:welcome)

name = names

loop do
  number1 = first_number
  number2 = second_number

  function_prompt = <<-QQQ
  What would you like to do?
  1) add
  2) subtract
  3) multiply
  4) divide
   QQQ

  language_function_prompt = <<-QQC
  Qu'est-ce que tu aimerais faire?
  1 ) ajouter
  2 ) soustraire
  3 ) multiplier
  4 ) fracture
    QQC

  if LANGUAGE == :en
    prompt(function_prompt)
  else
    prompt(language_function_prompt)
  end

  function = functions
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

  messages(:result)
  prompt result.to_s

  messages(:new_calc)
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

messages(:thank_you)
