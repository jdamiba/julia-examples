using Plots
plotlyjs()
x = -10:0.5:10 # create an array of values from -10 to 10 using increments of 0.5

f(x) = x^2

g(x) = x^3

y1 = f.(x) # broadcast function over all entries in array x

y2 = g.(x)

scatter!(x, y1)
scatter!(x, y2)
