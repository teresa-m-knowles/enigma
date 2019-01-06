require 'pry'
require './lib/enigma'
message = File.read(ARGV.first)
enigma = Enigma.new
encrypted_file = File.open(ARGV.last, "w")
encrypted = enigma.encrypt(message)

encrypted_file.write(encrypted[:encryption])

puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"
