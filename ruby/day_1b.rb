# Bonus problem: If you’re feeling the need for a little more, write
# a program that picks a random number. Let a player guess the
# number, telling the player whether the guess is too low or too high.

number = rand(10)
input = -1

puts 'Guess the number! (0..9)'

until input == number
    input = gets.to_i

    if input < number
        puts 'higher!'
    end

    if input > number
        puts 'lower!'
    end
end

puts 'You got it!'
