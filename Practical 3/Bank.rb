require_relative 'Developers.rb'

class Bank

  attr_accessor :name, :no_of_employees, :amount_of_deposits, :amount_of_loans, :nama_status

  def initialize (*args)
    @name ,@no_of_employees, @amount_of_deposits,@amount_of_loans,@nama_status = args
  end

  #called in Nama.rb
  def moves_loans_to_nama
      @nama_status = nama_status
      @amount_of_loans = amount_of_loans.to_i #convert to integer
      @amount_of_deposits = amount_of_deposits.to_i
    if amount_of_loans > (1.2 * amount_of_deposits) then
      @nama_status = true
      float_amount_of_loans = amount_of_loans * 0.8
      @amount_of_loans = float_amount_of_loans.to_i
    end

  end

  #called in Nama.rb
  def bank_is_solvent
    @amount_of_deposits = amount_of_deposits.to_i
    @amount_of_loans = amount_of_loans.to_i
    if amount_of_deposits > amount_of_loans then
      return true
    else
      return false
    end

  end
end