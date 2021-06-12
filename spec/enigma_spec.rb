require 'time'
require 'rspec'
require 'shift_generator'
require 'enigma'

RSpec.describe Enigma do
  describe 'Instantiation' do
    it "exists" do
      enigma = Enigma.new

      expect(enigma).to be_a(Enigma)
    end

    it "has attributes" do
      enigma = Enigma.new

      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

      expect(enigma.characeter_set).to eq(expected)
    end

  end
end
