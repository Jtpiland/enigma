class ShiftGenerator
  attr_reader :numbers
  attr_accessor :random_five,
                :a_key,
                :b_key,
                :c_key,
                :d_key,
                :transmission_date,
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
    @a_offset = a_offset
    @b_offset = b_offset
    @c_offset = c_offset
    @d_offset = d_offset
    @total_shift = total_shift
  end

  def random_five_digit_number
    @numbers.sample(5).each do |number|
      @random_five << number
    end
    @random_five
  end

  def determine_keys
    five = random_five_digit_number
    @a_key = five[0..1].join.to_i
    @b_key = five[1..2].join.to_i
    @c_key = five[2..3].join.to_i
    @d_key = five[3..4].join.to_i
  end

  def offset
    t = Time.now
    new_time = t.strftime("%m/%d/%y").delete('/').to_i
    squared = new_time ** 2
    @a_offset = squared.digits[3]
    @b_offset = squared.digits[2]
    @a_offset = squared.digits[1]
    @a_offset = squared.digits[0]


    # date = (("040895").to_i) ** 2
    # last_four = date
    # get today's date
    # square today's date
    # take the last four digits of that number
    # a_offset = fourth to last digit
    # b_offset = third to last digit
    # c_offset = second to last digit
    # d_offset = last digit
  end

  # def create_new_hash
  #   #keys are the shift(a,b,c,d) and values are the sum of the key and a_offset
  #   shift_hash = Hash.new { |hash, key| hash[key] =  0}
  #   shift_hash[shift_position] = key + offset (for each position)
  #
  #   end
  # end

end
