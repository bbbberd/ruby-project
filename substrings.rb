def substrings(word, dictionary)
  # Create an empty hash to store results
  result = Hash.new(0)

  # Normalize the input word by converting it to lowercase
  word.downcase!

  # Check each word in the dictionary
  dictionary.each do |substring|
    # Find all matches of the dictionary word in the input word
    matches = word.scan(substring.downcase)
    # Update the count in the result hash
    result[substring] += matches.size unless matches.empty?
  end

  result
end

def interactive_prompt(dictionary)
  puts "Welcome to the Substring Finder!"
  loop do
    print "\nEnter a sentence to analyze (or type 'exit' to quit): "
    input = gets.chomp
    break if input.downcase == 'exit'

    result = substrings(input, dictionary)
    if result.empty?
      puts "No matches found in the dictionary!"
    else
      puts "Substring matches:"
      result.each { |key, value| puts "#{key}: #{value}" }
    end
  end
  puts "Goodbye!"
end

# Example dictionary
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

# Start the interactive prompt
interactive_prompt(dictionary)

