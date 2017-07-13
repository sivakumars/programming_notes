system 'clear'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    pre_transaction_amount = register.total_money
    register.accept_money(transaction)
    post_transaction_amount = register.total_money

    assert_equal(pre_transaction_amount + 20, post_transaction_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(199.99)
    transaction.amount_paid = 200

    expected_change = 200 - 199.99
    actual_change = register.change(transaction)

    assert_equal(expected_change, actual_change)
  end

  def test_give_receipt
    item_cost = 199.99
    register = CashRegister.new(1000)
    transaction = Transaction.new(item_cost)

    output = "You've paid $#{item_cost}.\n"
    register.give_receipt(transaction)

    assert_output(output) { register.give_receipt(transaction) }
  end

  def test_prompt_for_payment
    transaction = Transaction.new(199.99)
    transaction.prompt_for_payment

    assert_equal(200, transaction.amount_paid)
  end
end
