
def prompt(message)
  puts "=> #{message}"
end

def car_loan_monthly_ir(apr)
  apr_per_month = apr.to_f / 12.0
  apr_per_month.round(3)
  payment = loan_amount/duration
end

loan_amount = ''

loop do
  prompt('How much is your loan?')
  loan_amount = gets.chomp
  if loan_amount != "0"
    break
  else
    prompt('You need a different number.')
  end
end

apr = ''
loop do
  prompt("What's your APR?")
  apr = gets.chomp
  if apr != "0"
    break
  else
    prompt('Try a different amount.')
  end
end

duration = ''
loop do
  prompt('How long is your loan?')
  duration = gets.chomp
  prompt('Is that months or years?')
  mnth_yr = gets.chomp
  if duration != '0'
    if mnth_yr == 'years'
      duration = (duration.to_i * 12)
      break
    else mnth_yr == 'months'
      duration
      break
    end
  else
    prompt('You need a longer loan')
  end
end

prompt("Your monthly interest rate is #{car_loan_monthly_ir(apr)}")
prompt("For #{duration} months.")
