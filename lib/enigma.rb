require 'time'
require 'date'
require 'shift_generator'

class Enigma
  attr_reader :character_set

  def initialize
    @shift_gen = ShiftGenerator.new
    @shift_gen.create_total_shift_hash
    @character_set = ("a".."z").to_a << " "
    # require "pry"; binding.pry
  end

  def encrypt#(message, key, date)
    message = "hello world"
    @index_message = message.to_s.split("") #=> enigma.encrypt in pry
    #@five_digit_key = key
    #take in message
    #set default key and date arg to random5 and today's date but need to allow them to be overwritten if input by user
    #encrypt message using shift = key/date sum
    #find index in character set of each letter in message, that's where the shift will begin.... 
    #return hash {:encryption => '', :key => '02715'=@shift_gen.random_five.join.to_s, :date => "040895"(DDMMYY)= @shift_gen.date.to_s}
  end


  def decrypt(ciphertext, key, date)
    #take in encrypted message(ciphertext)
    #deccrypt message using shift = key/date sum
    #return hash {:decryption => '', :key => '02715', :date => "040895"(DDMMYY)}
  end


end
