# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each.

(1..16).each_with_index do |e, idx|
    print e, ' '
    puts if (idx + 1) % 4 == 0
end

# Now, do the same with each_slice in
# Enumerable.

(1..16).each_slice(4) {|e| puts e.join(' ')}
