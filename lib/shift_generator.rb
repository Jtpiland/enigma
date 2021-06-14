require 'time'
require 'date'

class ShiftGenerator
  attr_reader :numbers
  attr_accessor :random_five,
                :a_key,
                :b_key,
                :c_key,
                :d_key,
                :date,
                :date_squared,
                :a_offset,
                :b_offset,
                :c_offset,
                :d_offset,
                :total_shift

  def initialize
    @numbers = [0,1,2,3,4,5,6,7,8,9]
    @random_five = []
    @a_key = a_key
    @b_key = b_key
    @c_key = c_key
    @d_key = d_key
    @date = date
    @date_squared = date_squared
    @a_offset = a_offset
    @b_offset = b_offset
    @c_offset = c_offset
    @d_offset = d_offset
    @total_shift = total_shift
  end

  def random_five_digit_number
    @random_five = []
    @numbers.sample(5).each do |number|
      @random_five << number.to_s
    end
    @random_five
  end

  def determine_keys(key = random_five_digit_number)
    # five = random_five_digit_number
    @a_key = key[0..1].join.to_i
    @b_key = key[1..2].join.to_i
    @c_key = key[2..3].join.to_i
    @d_key = key[3..4].join.to_i
  end

  def determine_offset(date = Time.now)
    date = Time.now
    @converted_date = date.strftime("%d/%m/%y").delete('/').to_i
    @date_squared = (@converted_date ** 2).to_s.split("").reverse
    @a_offset = date_squared[3].to_i
    @b_offset = date_squared[2].to_i
    @c_offset = date_squared[1].to_i
    @d_offset = date_squared[0].to_i
  end

  def create_total_shift_hash
    random_five_digit_number
    determine_keys
    determine_offset
    @total_shift = Hash.new { |hash, key| hash[key] = 0 }
    @total_shift[:a_shift] = @a_key + @a_offset
    @total_shift[:b_shift] = @b_key + @b_offset
    @total_shift[:c_shift] = @c_key + @c_offset
    @total_shift[:d_shift] = @d_key + @d_offset
  end
end
