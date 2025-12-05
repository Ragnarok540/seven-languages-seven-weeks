# Print the string “Hello, world.”

puts 'Hello, world.'

# For the string “Hello, Ruby,” find the index of the word “Ruby.”

idx = 'Hello, Ruby'.index('Ruby')
puts idx

# Print your name ten times.

x = 0

while x < 10
    puts 'nova'
    x = x + 1
end

# Alternative

10.times {puts "nova alt"}

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.

x = 1

until x > 10
    puts "This is sentence number #{x}"
    x = x + 1
end

# Alternative

(1..10).each {|num| puts "This is sentence number #{num} alt"}
