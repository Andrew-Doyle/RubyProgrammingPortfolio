require_relative 'Bank.rb'

class  Developers

  attr_accessor :name, :net_worth, :loans, :banks_loaned_from, :bankrupt
  def initialize (name, net_worth, loans, banks_loaned_from, bankrupt)
    @name = name
    @net_worth = net_worth
    @loans = loans
    @banks_loaned_from = banks_loaned_from
    @bankrupt = bankrupt

  end

  # This method is called in Nama.rb
  def is_developer_solvent?
     net_worth = @net_worth
     loans = @loans
     net = net_worth.to_i
     loans = loans.to_i
     if net > loans then
       return true
     else
       return false
     end
  end

  # This method is called in Nama.rb
  def owes_amount
    @loans = loans
    owes = loans.to_i
    return owes

  end

  # This method is called in Nama.rb
  def owes_banks
    amount_of_loans = @loans
    loans_from_bank = amount_of_loans.to_i
    #owes = @owes
    name = @name
    dev_name = name.chomp
    #Specifies the proportion of loans belonging to banks:
    case
      when dev_name == 'Johnny Ronan' then
        owes =  loans_from_bank * 0.70
      when dev_name  == 'Richard Barrett' then
        owes =  loans_from_bank * 0.80
      when dev_name  == 'Sean Mulryan' then
        owes =  loans_from_bank * 0.65
      when dev_name  ==  'Bernard McNamara' then
        owes =  loans_from_bank * 0.90
      when dev_name  ==  'Liam Carroll' then
        owes =  loans_from_bank * 0.95
    end

    return owes.to_i
  end

  def bankrupt_test
    @net_worth = net_worth
    @loans = loans
    @bankrupt = bankrupt
    @name = name
    #convert to integer:
    net_worth_int = net_worth.to_i
    loans_total_int = loans.to_i
    dev_name = name.chomp
    if loans_total_int > (net_worth_int * 1.25)then
      @bankrupt = true

    end

  end


end