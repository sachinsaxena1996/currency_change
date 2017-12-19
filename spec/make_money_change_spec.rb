require './make_money_change'
require './currency_def'
describe MakeMoneyChange do
   describe 'instance methods' do
      describe '#change_for(input_amount)' do
        it "returns the correct change for amount 41" do
          ch = MakeMoneyChange.new
          exp = {quarters: 1, dimes: 1, nickels: 1, pennies: 1}
          expect(ch.change_for(41)).to eq exp
        end

        it "returns the correct change for amount 25" do
          ch = MakeMoneyChange.new
          exp = {quarters: 1}
          expect(ch.change_for(25)).to eq exp
        end

        it "returns the correct change for amount 10" do
          ch = MakeMoneyChange.new
          exp = {dimes: 1}
          expect(ch.change_for(10)).to eq exp
        end

        it "returns the correct change for amount 5" do
          ch = MakeMoneyChange.new
          exp = {nickels: 1}
          expect(ch.change_for(5)).to eq exp
        end

        it "returns the correct change for amount 4" do
          ch = MakeMoneyChange.new
          exp = {pennies: 4}
          expect(ch.change_for(4)).to eq exp
        end
      end
    end
end