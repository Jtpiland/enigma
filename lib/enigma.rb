require 'time'
require 'date'
require 'shift_generator'

class Enigma
  attr_reader :character_set

  def initialize
    @shift_gen = ShiftGenerator.new
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = @random_five.join.to_s, date = @date)
    @encrypted_hash = {}
    @shift_gen.create_total_shift_hash
    @shift_gen.total_shift[:a_shift] = 3
    @shift_gen.total_shift[:b_shift] = 27
    @shift_gen.total_shift[:c_shift] = 73
    @shift_gen.total_shift[:d_shift] = 20

    @index_ciphertext = message.to_s.split("") #=> enigma.encrypt in pry
    @positions_array = [] #this array shows the original index in the character_set for each letter in the message
    @index_ciphertext.each do |letter|
      if @character_set.index(letter) != nil
        @positions_array << @character_set.index(letter)
      end
    end
    @positions_array
    @new_message = []
    @index_ciphertext.each_with_index do |letter, index|
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
      end
    end
    @encrypted_hash[:encryption] = @new_message.join.to_s
    @encrypted_hash[:key] = key.to_s
    @encrypted_hash[:date] = date.to_s
    @encrypted_hash
  end


  def decrypt(ciphertext, key, date)
    @encrypted_hash = {}
    @shift_gen.create_total_shift_hash
    @shift_gen.total_shift[:a_shift] = 3
    @shift_gen.total_shift[:b_shift] = 27
    @shift_gen.total_shift[:c_shift] = 73
    @shift_gen.total_shift[:d_shift] = 20

    @index_ciphertext = ciphertext.to_s.split("") #=> enigma.encrypt in pry
    @positions_array = [] #this array shows the original index in the character_set for each letter in the message
    @index_ciphertext.each do |letter|
      if @character_set.index(letter) != nil
        @positions_array << @character_set.index(letter)
      end
    end
    @positions_array
    @new_message = []
    @index_ciphertext.each_with_index do |letter, index|
      if ((index + 1) % 4 == 1) || index == 0
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(-(@shift_gen.total_shift[:a_shift]))[0]
        @new_message << @new_letter
      elsif ((index + 1) % 4 == 2) || index == 1
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(-(@shift_gen.total_shift[:b_shift]))[0]
        @new_message << @new_letter
      elsif ((index + 1) % 4 == 3) || index == 2
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(-(@shift_gen.total_shift[:c_shift]))[0]
        @new_message << @new_letter
      elsif ((index + 1) % 4 == 0) || index == 3
        @new_set = @character_set.rotate(@positions_array[index])
        @new_letter = @new_set.rotate(-(@shift_gen.total_shift[:d_shift]))[0]
        @new_message << @new_letter
      end
    end
    @encrypted_hash[:decryption] = @new_message.join.to_s
    @encrypted_hash[:key] = key.to_s
    @encrypted_hash[:date] = date.to_s
    @encrypted_hash
  end


end
