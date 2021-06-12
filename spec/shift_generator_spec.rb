
require './lib/shift_generator'

RSpec.describe ShiftGenerator do
  describe 'Instantiation' do

    it "exists" do
      shift = ShiftGenerator.new

      expect(shift).to be_a(ShiftGenerator)
    end

    it "has attributes" do
      shift = ShiftGenerator.new

      expect(shift.numbers).to eq([0,1,2,3,4,5,6,7,8,9])
    end
  end

  describe 'Methods' do

    it "can generate a random five digit number" do
      shift = ShiftGenerator.new

      expect(shift.random_five_digit_number.length).to eq(5)
      expect(shift.random_five_digit_number).to be_a(Array)

    end

    it "can determine the four keys from random five digit number" do
      shift = ShiftGenerator.new
      random_five = [3,2,7,1,5]
      allow(shift).to receive(:random_five_digit_number).and_return(random_five)

      expect(shift.random_five_digit_number).to eq([3,2,7,1,5])
      shift.determine_keys
      expect(shift.a_key).to eq(32)
      expect(shift.b_key).to eq(27)
      expect(shift.c_key).to eq(71)
      expect(shift.d_key).to eq(15)
    end

    it "can determine turn today's date into offset" do
      shift = ShiftGenerator.new
      time_stub = "2021-06-11 20:09:42.846327 -0500"
      allow(Time).to receive(:now).and_return(time_stub)

      shift.offset
      expect(shift.a_offset).to eq(6)

    end



  end
end
