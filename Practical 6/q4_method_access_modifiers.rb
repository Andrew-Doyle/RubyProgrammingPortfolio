class Q4MethodAccessModifiers
  attr_reader :piggy_bank_confirmed
  protected   :piggy_bank_confirmed
  attr_accessor :cash_left

  def initialize(cash_left)
    @cash_left = cash_left
  end

  def compare_balances?(other_piggy_bank)
    @piggy_bank_confirmed > other_piggy_bank.piggy_bank_confirmed
  end

end

class MoneyMoves

  def initialize(piggy_bank1, piggy_bank2)
    @piggy_bank1 = piggy_bank1
    @piggy_bank2 = piggy_bank2
  end

  def method_protected_debit(piggybank, amount)
    piggybank.cash_left -= amount

  end

  def method_protected_credit(piggybank, amount)
    piggybank.cash_left += amount
  end

  def method_protected_transfer(amount)
    method_protected_debit(@piggy_bank1,amount)
    method_protected_credit(@piggy_bank2,amount)
  end

  def method_private_debit(piggybank, amount)
    piggybank.cash_left -= amount

  end

  def method_private_credit(piggybank, amount)
    piggybank.cash_left += amount
  end

  def method_private_transfer(amount)
    method_private_debit(@piggy_bank1,amount)
    method_private_credit(@piggy_bank2,amount)
  end

  def method_public_transfer(amount)
    method_private_debit(@piggy_bank1,amount)
    method_private_credit(@piggy_bank2,amount)
  end

  public    :method_public_transfer, :method_protected_transfer, :method_private_transfer
  private   :method_private_credit, :method_private_debit
  protected :method_protected_credit, :method_protected_debit

end

class MoneyMovesSubclass < MoneyMoves

  def initialize(piggy_bank1, piggy_bank2)
    @piggy_bank1 = piggy_bank1
    @piggy_bank2 = piggy_bank2
  end

end

cash_behind_the_piano =  Q4MethodAccessModifiers.new(50000)
cash_in_my_wallet =  Q4MethodAccessModifiers.new(50)

puts "\nTesting the values before any methods implemented: \n\n"
puts "Cash behind the piano: #{cash_behind_the_piano.cash_left}"
puts "Cash in my wallet: #{cash_in_my_wallet.cash_left} "

puts "\nTesting the implementation of the methods - an instance of MoneyMoves is created and a value of 20 passed into the protected_method_transfer method: \n\n"
move_money_test = MoneyMoves.new(cash_in_my_wallet,cash_behind_the_piano)
move_money_test.method_protected_transfer(20)
puts "Cash behind the piano: #{cash_behind_the_piano.cash_left}"
puts "Cash in my wallet: #{cash_in_my_wallet.cash_left} "

move_money_test_subclass = MoneyMovesSubclass.new(cash_in_my_wallet,cash_behind_the_piano)

puts "\nTesting the implementation of the methods - an instance of MoneyMovesSubclass is created and a value of 20 passed into the private_method_transfer method: \n\n"
move_money_test_subclass.method_private_transfer(20)
puts "Cash behind the piano: #{cash_behind_the_piano.cash_left}"
puts "Cash in my wallet: #{cash_in_my_wallet.cash_left} "
