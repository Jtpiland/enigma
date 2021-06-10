reader = File.open(ARGV[0], "r")

incoming_text = reader.read

reader.close

writer = File.open(ARGV[1], "w")

test_split = incoming_text.split(" ")

writer.write(test_split)

writer.close
