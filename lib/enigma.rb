require 'time'
require 'date'
require 'shift_generator'

class Enigma
  attr_reader :character_set

  def initialize
    @shift_gen = ShiftGenerator.new
    @character_set = ("a".."z").to_a << " "
  end

  # def find_positions(original_array, look_up_array)
  #   positions_array = []
  #   original_array.each do |x|
  #     if look_up_array.index(x) != nil
  #       positions_array << look_up_array.index(x)
  #     end
  #   end
  #   positions_array
  # # positions_array.first => for the first matched element
  # end

  def encrypt #(message, key, date)
    @shift_gen.create_total_shift_hash
    @shift_gen.total_shift[:a_shift] = 3
    @shift_gen.total_shift[:b_shift] = 27
    @shift_gen.total_shift[:c_shift] = 73
    @shift_gen.total_shift[:d_shift] = 20
    message = "hello world"
    @index_message = message.to_s.split("") #=> enigma.encrypt in pry
    # require "pry"; binding.pry
    @positions_array = [] #this array shows the original index in the character_set for each letter in the message
    @index_message.each do |letter|
      if @character_set.index(letter) != nil
        @positions_array << @character_set.index(letter)
      end
    end
    @positions_array
    @new_message = []
    @index_message.each_with_index do |letter, index|
      if ((index + 1) % 4 == 1) || index == 0
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(@shift_gen.total_shift[:a_shift])[0]
        @new_message << @new_letter
      elsif ((index + 1) % 4 == 2) || index == 1
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(@shift_gen.total_shift[:b_shift])[0]
        @new_message << @new_letter
      elsif ((index + 1) % 4 == 3) || index == 2
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(@shift_gen.total_shift[:c_shift])[0]
        @new_message << @new_letter
      elsif ((index + 1) % 4 == 0) || index == 3
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(@shift_gen.total_shift[:d_shift])[0]
        @new_message << @new_letter
        require "pry"; binding.pry
      end
    end
    @new_message
    # require "pry"; binding.pry
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
