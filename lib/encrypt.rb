reader = File.open(ARGV[0], "r")

incoming_text = reader.read

reader.close

writer = File.open(ARGV[1], "w")

capitalized_text = incoming_text.upcase

writer.write(capitalized_text)

writer.close
