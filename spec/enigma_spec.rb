require 'time'
require 'date'
require 'rspec'
require 'spec_helper'

RSpec.describe Enigma do
  describe 'Instantiation' do
    it "exists" do
      enigma = Enigma.new

      expect(enigma).to be_a(Enigma)
    end

    it "has attributes" do
      enigma = Enigma.new

      expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

      expect(enigma.character_set).to eq(expected)
    end
  end

  describe 'Methods' do
    it "can encrypt a message" do
      enigma = Enigma.new

      expected = {
        :encryption => "keder ohulw",
        :key => "02715",
        :date => "040895"
        }

      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end
  
    it "can decrypt a message" do
      enigma = Enigma.new

      expected = {
        :decryption => "hello world",
        :key => "02715",
        :date => "040895"
        }

      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end
  end
end
