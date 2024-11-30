def caesar_cipher(input, shift)
  # Ensure the shift is within 0-25 range
  shift = shift % 26

  input.chars.map do |char|
    if char.match?(/[A-Za-z]/)
      base = char.ord < 91 ? 'A'.ord : 'a'.ord
      ((char.ord - base + shift) % 26 + base).chr
    else
      char
    end
  end.join
end

def interactive_cipher
  puts "Welcome to the Caesar Cipher CLI!"
  loop do
    print "\nEnter the string to encrypt (or type 'exit' to quit): "
    input = gets.chomp
    break if input.downcase == 'exit'

    print "Enter the shift factor (number): "
    shift = gets.chomp.to_i

    result = caesar_cipher(input, shift)
    puts "Encrypted string: #{result}"
  end
  puts "Goodbye!"
end

# Run the interactive CLI
interactive_cipher

