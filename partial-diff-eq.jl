Δx = 0.001
x = 5:Δx:10
u(x) = sin(2π*x)
using Plots
plotlyjs()
Plots.plot(u, 0, 10, lw=2)
Plots.scatter!(x, u.(x))
Plots.plot!(x, u.(x), lw=1)
