using StatsBase
using Plots
using InteractiveUtils

num_sides = 6
sides = 1:num_sides
throw = rand(sides) # return one dice once]
sample = rand(sides, 10) # roll one dice 10 tiimes

frequencies = StatsBase.countmap(sample)
# count how many times each
# outcome occurs

bar(frequencies, alpha=0.5,
	size=(400, 300), leg=false,
	xlabel="outcome", ylabel="number of rolls", xlim=(0, num_sides+1))

max_rolls = 10000
rolls2 = rand(1:num_sides, max_rolls)

@bind num_rolls2 Slider(1:max_rolls, show_value=true)
