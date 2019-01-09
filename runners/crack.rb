require './lib/enigma'
enigma = Enigma.new

encrypted_message = File.read(ARGV[0])
decrypted_destination = File.open(ARGV[1], "w")
date = ARGV[2]


decrypt_hash = enigma.crack(encrypted_message, date)

decrypted_destination.write(decrypt_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{decrypt_hash[:key]} and date #{decrypt_hash[:date]}"
