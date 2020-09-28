# create an a list of factorials
using Plots

factorials = zeros(0)

N = 1000

for i in 1:N
    append!(factorials, factorial(big(i)))
end

factorials
