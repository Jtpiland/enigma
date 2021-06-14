require 'time'
require 'date'
require './lib/shift_generator'

class Enigma
  attr_reader :character_set

  def initialize
    @shift_gen = ShiftGenerator.new
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = @shift_gen.random_five_digit_number, date = @shift_gen.create_six_digit_date)
    @encrypted_hash = {}
    @shift_gen.create_total_shift_hash(key, date)
    @index_message = message.downcase.to_s.split("")
    @positions_array = []
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
      end
    end
    @encrypted_hash[:encryption] = @new_message.join.to_s
    @encrypted_hash[:key] = key.to_s
    @encrypted_hash[:date] = date.to_s
    @encrypted_hash
  end

  def decrypt(ciphertext, key = @shift_gen.random_five_digit_number, date = @shift_gen.create_six_digit_date)
    @decrypted_hash = {}
    @shift_gen.create_total_shift_hash(key, date)
    @index_ciphertext = ciphertext.to_s.split("")
    @positions_array = []
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
    @decrypted_hash[:decryption] = @new_message.join.to_s
    @decrypted_hash[:key] = key.to_s
    @decrypted_hash[:date] = date.to_s
    @decrypted_hash
  end
end
