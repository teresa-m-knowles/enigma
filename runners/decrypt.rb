require 'pry'
require './lib/enigma'
enigma = Enigma.new

encrypted_message = File.read(ARGV.first)
decrypted_destination = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV.last


decrypt_hash = enigma.decrypt(encrypted_message, key, date)

decrypted_destination.write(decrypt_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{decrypt_hash[:key]} and date #{decrypt_hash[:date]}"
