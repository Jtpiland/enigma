require './lib/shift_generator'
require './lib/enigma'

reader = File.open(ARGV[0], "r")

incoming_text = reader.read.chomp

reader.close

writer = File.open(ARGV[1], "w")

enigma = Enigma.new

key = ARGV[2]
date = ARGV[3]

decrypted_hash = enigma.decrypt(incoming_text, key, date)

writer.write(decrypted_hash[:decryption])

writer.close
