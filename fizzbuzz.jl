function fizzbuzz(x)
    if x % 15 == 0
        println("fizzbuzz")
    elseif x % 5 == 0
        println("buzz")
    elseif x % 3 == 0
        println("fizz")
    else
        println(x)
    end
end

for i = 1:50
    fizzbuzz(i)
end
