require './lib/shift_generator'
require './lib/enigma'

reader = File.open(ARGV[0], "r")

incoming_text = reader.read.chomp

reader.close

writer = File.open(ARGV[1], "w")

enigma = Enigma.new

encryption_hash = enigma.encrypt(incoming_text)

writer.write(encryption_hash[:encryption])

writer.close

puts "Created 'encrypted.txt' with the key #{encryption_hash[:key]} and date #{encryption_hash[:date]}"
