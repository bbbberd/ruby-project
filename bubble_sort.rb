def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    # Iterate through the array
    (n - 1).times do |i|
      # Compare adjacent elements
      if array[i] > array[i + 1]
        # Swap them if they are out of order
        array[i], array[i + 1] = array[i + 1], array[i]
        swapped = true
      end
    end

    # Break the loop if no swaps occurred in the last pass
    break unless swapped
  end

  array
end

# Example usage
puts bubble_sort([4,3,78,2,0,2]).inspect
# Output: [0,2,2,3,4,78]

