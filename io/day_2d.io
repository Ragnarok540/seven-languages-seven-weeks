// Write a program that gives you ten tries to guess a random number
// from 1–100. If you would like, give a hint of “hotter” or “colder”
// after the first guess.


rand := (((Date now asNumber) % 1) * 100) ceil
found := false
x := 0
prev_distance := 0

while(found == false,
    prev_distance := (x - rand) abs
    "Guess the number between 1 and 100" println
    x := File standardInput readLine asNumber
    if(x == rand,
        found := true
        "Correct guess!" println,
        "Try again!" println
        distance := (x - rand) abs

        if(distance < prev_distance,
            "Hotter" println
        )
        if(distance == prev_distance,
            "Same" println
        )
        if(distance > prev_distance,
            "Colder" println
        )
    )
)
