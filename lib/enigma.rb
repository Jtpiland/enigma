require 'time'
require 'date'
require 'shift_generator'

class Enigma
  attr_reader :character_set

  def initialize
    @shift_gen = ShiftGenerator.new
    # @shift_gen.random_five_digit_number
    # @shift_gen.determine_keys
    # @shift_gen.determine_offset
    @shift_gen.create_total_shift_hash
    # require "pry"; binding.pry
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    #take in message
    #encrypt message using shift = key/date sum
    #return hash {:encryption => '', :key => '02715'=@shift_gen.random_five.join.to_s, :date => "040895"(DDMMYY)= @shift_gen.date.to_s}
  end


  def decrypt(ciphertext, key, date)
    #take in encrypted message(ciphertext)
    #deccrypt message using shift = key/date sum
    #return hash {:decryption => '', :key => '02715', :date => "040895"(DDMMYY)}
  end


end
