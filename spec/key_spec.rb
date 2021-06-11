require './lib/key'

RSpec.describe Key do
  describe 'Instantiation' do

    it "exists" do
      key = Key.new

      expect(key).to be_a(Key)
    end

    it "has attributes" do
      key = Key.new

      expect(key.numbers).to eq([0,1,2,3,4,5,6,7,8,9])
    end
  end

  describe 'Methods' do

    it "can generate a random five digit number" do
      key = Key.new

      expect(key.random_five_digit_number.length).to eq(5)
      expect(key.random_five_digit_number).to be_a(Array)

    end

    it "can determine the four keys from random five digit number" do
      key = Key.new
      random_five = [3,2,7,1,5]
      allow(key).to receive(:random_five_digit_number).and_return(random_five)

      expect(key.random_five_digit_number).to eq([3,2,7,1,5])
      # key.determine_keys
      # expect(key.a_key).to eq(32)
    end

    it "can determine turn today's date into offset" do
      key = Key.new

      # allow(key).to receive(:offset).and_return(date)



      expect(key.offset.a_offset).to eq(3)

    end



  end
end
