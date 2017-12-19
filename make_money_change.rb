require_relative 'currency_def'
class MakeMoneyChange

  def initialize
    @calc_change = {}
  end  

  def change_for(input_amount)
    begin
      if input_amount >= CurrencyDef::QUARTER
        @calc_change[:quarters] = (input_amount / CurrencyDef::QUARTER)
        change_for(input_amount % CurrencyDef::QUARTER) if input_amount % CurrencyDef::QUARTER != 0
      elsif input_amount < CurrencyDef::QUARTER && input_amount >= CurrencyDef::DIME
        @calc_change[:dimes] = (input_amount / CurrencyDef::DIME)
        change_for(input_amount % CurrencyDef::DIME) if input_amount % CurrencyDef::DIME != 0
      elsif input_amount < CurrencyDef::DIME && input_amount >= CurrencyDef::NICKEL
        @calc_change[:nickels] = (input_amount / CurrencyDef::NICKEL)
        change_for(input_amount % CurrencyDef::NICKEL) if input_amount % CurrencyDef::NICKEL != 0
      elsif input_amount < CurrencyDef::NICKEL && input_amount > 0
        @calc_change[:pennies] = input_amount
      elsif input_amount < 0
        raise 'please enter a positive amount'
      end
    rescue Exception => e
      puts e.message
    end
    return @calc_change
  end
end

begin
  ch = MakeMoneyChange.new
  p ch.change_for(1043)
rescue Exception => e
  puts e.message
end

# > change_for(25)
# {quarters: 1}
# > change_for(41)
# {quarters: 1, dimes: 1, nickels: 1, pennies: 1}