# Given:
# - loan amount (P)
# - annual interest rate
# - loan duration
#
# Steps:
# - SET monthly interest rate (J) = APR / 12
# - Divide interest rate by 100 to get decimal value for calculation
# - SET loan duration (N) in months = loan duration * 12
# - Calculate M using given formula

def prompt(message)
  puts "=>#{message}"
end

prompt("Hello! Welcome to the Loan Calculator")
prompt("What is your total loan amount?")
loan_amount = gets.chomp.to_f
prompt("What is the APR? (for 10.5%, enter 10.5")
percentage_apr = gets.chomp.to_f
prompt("What is the loan's duration (in years)?")
loan_duration_years = gets.chomp.to_f

p = loan_amount
j = percentage_apr / 100 / 12
n = loan_duration_years * 12
m = p * (j / (1 - (1 + j)**-n))

prompt("Based on the given information, your monthly payment is: $#{m}")
